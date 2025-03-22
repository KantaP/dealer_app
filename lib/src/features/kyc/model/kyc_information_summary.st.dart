import 'package:aconnec_1109_x/src/features/kyc/model/accept_law.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/address.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/fund.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycInformationSummaryPageState
    implements IPageState<KycInformationSummaryPageState> {
  KycAddressFormState _idCardAddressState = KycAddressFormState();
  KycAddressFormState _currentAddressState = KycAddressFormState();
  KycAddressFormState _workingAddressState = KycAddressFormState();
  KycFundFormState _fundState = KycFundFormState();
  AcceptLawState _acceptLawState = AcceptLawState();

  KycInformationSummaryPageState({
    KycAddressFormState? idCardAddressState,
    KycAddressFormState? currentAddressState,
    KycAddressFormState? workingAddressState,
    KycFundFormState? fundState,
    AcceptLawState? acceptLawState,
  }) {
    _idCardAddressState = idCardAddressState ?? KycAddressFormState();
    _currentAddressState = currentAddressState ?? KycAddressFormState();
    _workingAddressState = workingAddressState ?? KycAddressFormState();
    _fundState = fundState ?? KycFundFormState();
    _acceptLawState = acceptLawState ?? AcceptLawState();
  }

  KycAddressFormState get idCardAddressState => _idCardAddressState;
  KycAddressFormState get currentAddressState => _currentAddressState;
  KycAddressFormState get workingAddressState => _workingAddressState;
  KycFundFormState get fundState => _fundState;
  AcceptLawState get acceptLawState => _acceptLawState;

  @override
  KycInformationSummaryPageState copyWith(Map<String, dynamic> value) {
    return KycInformationSummaryPageState(
      idCardAddressState:
          value[KycInformationSummaryPageStateFields.idCardAddressState] ??
              _idCardAddressState,
      currentAddressState:
          value[KycInformationSummaryPageStateFields.currentAddressState] ??
              _currentAddressState,
      workingAddressState:
          value[KycInformationSummaryPageStateFields.workingAddressState] ??
              _workingAddressState,
      fundState:
          value[KycInformationSummaryPageStateFields.fundState] ?? _fundState,
      acceptLawState:
          value[KycInformationSummaryPageStateFields.acceptLawState] ??
              _acceptLawState,
    );
  }
}

class KycInformationSummaryPageStateFields {
  KycInformationSummaryPageStateFields._();

  static const String idCardAddressState = 'idCardAddressState';
  static const String currentAddressState = 'currentAddressState';
  static const String workingAddressState = 'workingAddressState';
  static const String fundState = 'fundState';
  static const String acceptLawState = 'acceptLawState';
}
