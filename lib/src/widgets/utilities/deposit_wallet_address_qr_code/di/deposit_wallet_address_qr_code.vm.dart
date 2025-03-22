import 'package:aconnec_1109_x/src/features/transaction/service/di/bitgo.service.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bitgo/get_deposit_wallet.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DepositWalletAddressQrCodeViewModel extends CustomViewModel {
  final BitgoService _bitgoService;

  DepositWalletAddressQrCodeViewModel(this._bitgoService);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }

  Future<ResponseGetDepositWalletModel> loadDepositAddress({
    required RequestGetDepositWalletModel request,
  }) async {
    try {
      final response = await _bitgoService.getDepositAddress(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
