import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/ndid_payment_success.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:ui' as ui;

@Injectable()
class NdidPaymentSuccessViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  NdidPaymentSuccessViewModel(this._firebaseService);

  final _stateSubject = BehaviorSubject<NdidPaymentSuccessPageState>.seeded(
      NdidPaymentSuccessPageState());

  Stream<NdidPaymentSuccessPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final GlobalKey slipForSaveKey = GlobalKey();

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  Future<void> exportSlip() async {
    final RenderRepaintBoundary boundary = slipForSaveKey.currentContext!
        .findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    final String slipFileName =
        '1109x-slip-${DateTime.now().toIso8601String()}.png';
    final path = join((await getTemporaryDirectory()).path, slipFileName);
    File imgFile = File(path);
    final bytes = await imgFile.writeAsBytes(pngBytes);
    final result = await ImageGallerySaver.saveFile(path);
    // print(result);
    DialogUtils.showToast(msg: 'Save image success');
  }

  Future<void> next() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress:
          KycPageNames.ndidSelectIdp.name,
      KycFinalPageStateFields.ndidPaymentResult: 'success'
    });
    // await _firebaseService.resetNdidAttempt();
    await _firebaseService.setKycProgress(updateProgress);
  }
}
