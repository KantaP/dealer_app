import 'dart:io';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:camera/camera.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/capture_face.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:image/image.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import '../../../../utilities/file.dart';

@Injectable()
class CaptureFaceViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  CaptureFaceViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject =
      BehaviorSubject<CaptureFacePageState>.seeded(CaptureFacePageState());
  Stream<CaptureFacePageState> get state => _stateSubject;

  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  CameraController get cameraController => _cameraController;
  Future<void> get initializeControllerFuture => _initializeControllerFuture;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
    _cameraController.dispose();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      _cameraController = CameraController(
        // Get a specific camera from the list of available cameras.
        cameras.last,
        // Define the resolution to use.
        ResolutionPreset.high,
        enableAudio: false,
      );

      // Next, initialize the controller. This returns a Future.
      _initializeControllerFuture = _cameraController.initialize();
      updateState({CaptureFacePageStateFields.initCamera: true});
    } on Exception catch (e) {
      DialogUtils.showToast(msg: e.toString());
    }
  }

  Future<void> onCaptureImage() async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;
      updateState({CaptureFacePageStateFields.isLoading: true});
      final snapshot = await _cameraController.takePicture();
      // Read a jpeg image from file path
      img.Image? decodeImage =
          img.decodeImage(File(snapshot.path).readAsBytesSync());
      img.Image? rotateImage = flipHorizontal(decodeImage!);
      // Resize the image
      img.Image resizedImage =
          img.copyResize(rotateImage, width: 720, height: 1280);

      // Save the image as jpg

      File(snapshot.path).writeAsBytesSync(img.encodePng(resizedImage));

      updateState({
        CaptureFacePageStateFields.isLoading: false,
        CaptureFacePageStateFields.previewFile: File(snapshot.path),
        CaptureFacePageStateFields.canRetake: true
      });
    } catch (e) {
      // If an error occurs, log the error to the console.
      updateState({CaptureFacePageStateFields.isLoading: false});
    }
  }

  Future<void> uploadImage() async {
    try {
      updateState({CaptureFacePageStateFields.isLoading: true});
      final state = _stateSubject.value;
      File file = state.previewFile!;
      final fullPath = await _firebaseService.uploadFile(
        FirebaseStorageValue.kycSelfieRef,
        file,
        FirebaseStorageValue.selfieNameFile,
      );

      await file.delete();
      await FileUtils.deleteCacheDir();
      await _firebaseService.saveKycDocument(
        KycDocuments.selfie.name,
        fullPath,
      );

      updateState({CaptureFacePageStateFields.isLoading: false});
      if (state.onCapture != null) {
        state.onCapture!();
      } else {
        await updateProgress();
      }
    } catch (e) {
      //Sentry.captureException(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      updateState({CaptureFacePageStateFields.isLoading: false});
    }
  }

  Future<void> updateProgress() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.firstStepProgress:
          KycPageNames.personalInformation.name,
    });
    await _firebaseService.setKycProgress(updateProgress);
    back();
    // _routesSubject.add(
    //   const AppRouteSpec(
    //     name: RoutesConstant.kycAll,
    //     action: AppRouteAction.replaceWith,
    //   ),
    // );
  }

  void back() {
    NavigationService.back(NavigationResult(null));
  }

  void retake() {
    updateState({
      CaptureFacePageStateFields.canRetake: false,
    });
  }
}
