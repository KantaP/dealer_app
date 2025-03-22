import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/bank/bindings/bank.binding.dart';
import 'package:aconnec_1109_x/src/features/bank/services/di/payment.firebase.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bank_function/bay_qr_request.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_pure_fiat_function/pure_fiat_create.m.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/qr_image.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:flutter/material.dart';

import '../../../model/cloudfunction/on_call_bank_function/response_bay_qr.m.dart';

class PromptPayQrCodeView extends StatelessWidget {
  const PromptPayQrCodeView({super.key, required this.data});

  final BayQrRequestModel data;

  Future<BayQrResponseModel> loadQrCode(BayQrRequestModel data) async {
    final AuthenticationFirebaseService authenticationFirebaseService =
        AuthenticateBinding.authenticationFirebaseService;
    final PaymentFirebaseService bankFirebaseService =
        BankBinding.bankFirebaseService;

    try {
      final user = await authenticationFirebaseService.getCurrentUser();
      final request = data.copyWith(ref2: user.id.toString());
      print(request.toJson());
      final response =
          await bankFirebaseService.onCallBayQrRequest(params: request);
      final purefiatResponse = await bankFirebaseService.pureFiatCreate(
          params: PureFiatCreateRequestModel(
        idUser: user.uid,
        paymentValue: double.parse(request.amount),
        qrData: response.content,
      ));
      print(purefiatResponse.toJson());
      return response;
    } on Exception catch (e) {
      DialogUtils.showToast(msg: e.toString(), type: 'error');
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomFuture(
      future: loadQrCode(data),
      customLoading: const SizedBox(
        height: 232,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      builder: (_, snapshot) {
        return SizedBox(
          height: 232,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.images.propmtPay.image(height: 20),
                const SizedBox(
                  height: Spacing.spacing20,
                ),
                QrCustomImage(
                  size: 150,
                  data: snapshot.data?.content ?? '',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
