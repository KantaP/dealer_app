import 'dart:io';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/file.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/capture_id_card.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class CaptureIdCardViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  CaptureIdCardViewModel(this._firebaseService);

  final _stateSubject =
      BehaviorSubject<CaptureIdCardPageState>.seeded(CaptureIdCardPageState());

  Stream<CaptureIdCardPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  CameraController get cameraController => _cameraController;
  Future<void> get initializeControllerFuture => _initializeControllerFuture;

  final logger = Logger();

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
    final cameras = await availableCameras();

    _cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      cameras.first,
      // Define the resolution to use.
      ResolutionPreset.high,
      enableAudio: false,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _cameraController.initialize();
    updateState({CaptureIdCardPageStateFields.initCamera: true});
  }

  Future<void> onCaptureImage() async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;
      updateState({CaptureIdCardPageStateFields.isLoading: true});
      final snapshot = await _cameraController.takePicture();
      // Read a jpeg image from file path
      img.Image? image = img.decodeImage(File(snapshot.path).readAsBytesSync());

      // Resize the image
      img.Image resizedImage = img.copyResize(image!, width: 720, height: 1280);

      // Save the image as jpg

      File(snapshot.path).writeAsBytesSync(img.encodePng(resizedImage));

      updateState({
        CaptureIdCardPageStateFields.isLoading: false,
        CaptureIdCardPageStateFields.previewFile: File(snapshot.path),
        CaptureIdCardPageStateFields.canRetake: true,
      });
    } catch (e) {
      // If an error occurs, log the error to the console.
      // print(e);
      updateState({CaptureIdCardPageStateFields.isLoading: false});
    }
  }

  Future<void> uploadImage() async {
    try {
      updateState({CaptureIdCardPageStateFields.isLoading: true});
      final state = _stateSubject.value;
      File file = state.previewFile!;
      final fullPath = await _firebaseService.uploadFile(
        FirebaseStorageValue.kycDocumentsFrontIdCardRef,
        file,
        FirebaseStorageValue.frontIdCardNameFile,
      );

      await file.delete();
      await FileUtils.deleteCacheDir();

      await _firebaseService.saveKycDocument(
        KycDocuments.frontIdCard.name,
        fullPath,
      );
      updateState({CaptureIdCardPageStateFields.isLoading: false});
      if (state.onCapture != null) {
        state.onCapture!();
      } else {
        NavigationService.toReplacementWithNamed(
            RoutesConstant.captureBackIdCard);
        // _routesSubject.add(
        //   const AppRouteSpec(
        //     name: RoutesConstant.captureBackIdCard,
        //     action: AppRouteAction.replaceWith,
        //   ),
        // );
      }
    } catch (e) {
      updateState({CaptureIdCardPageStateFields.isLoading: false});
      //Sentry.captureException(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
    }
  }

  void back() {
    NavigationService.back(NavigationResult(null));
  }

  void retake() {
    updateState({
      CaptureIdCardPageStateFields.canRetake: false,
    });
  }
}
