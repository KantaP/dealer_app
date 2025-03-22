import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/data/repositories/agentAsDatasource.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/agentIdpDatasource.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/ndidService.repo.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/dealer_ndid.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/public_idp_param.m.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/model/idp_as.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_ref.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/request_rp_create.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class DealerNdidViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  final AgentIdpDatasourceRepository _agentIdpDatasourceRepository;
  final AgentAsDatasourceRepository _agentAsDatasourceRepository;
  final NdidServiceRepository _ndidServiceRepository;
  DealerNdidViewModel(
    this._firebaseService,
    this._agentIdpDatasourceRepository,
    this._agentAsDatasourceRepository,
    this._ndidServiceRepository,
  );

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject.seeded(DealerNdidPageState());
  Stream<DealerNdidPageState> get state => _stateSubject;

  late KycFinalViewModel _kycLevel2ViewModel;

  List<IdpAsModel> agentAsIdp = [];

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void setKycLevel2ViewModel(KycFinalViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  Future<void> next(IdpModel item) async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });

    try {
      await sendRequest(item);
      final kycProgress = await _firebaseService.getKycProgress();
      final updateProgress =
          kycProgress.copyWith({KycFinalPageStateFields.thirdStepProgress: 4});
      try {
        await _firebaseService.addNdidAttempt();
      } on Exception {
        _kycLevel2ViewModel.updateState({
          KycLevel2PageStateFields.isLoading: false,
        });
        return;
      }
      await _firebaseService.setKycProgress(updateProgress);
      _kycLevel2ViewModel.updateState({
        KycLevel2PageStateFields.isLoading: false,
      });
    } catch (e) {
      _kycLevel2ViewModel.updateState({
        KycLevel2PageStateFields.isLoading: false,
      });
    }
  }

  Future<void> getAgentList() async {
    final data = await _agentIdpDatasourceRepository.getAll();
    updateState({
      DealerNdidPageStateFields.dealers: data,
    });
  }

  Future<bool> sendRequest(IdpModel item) async {
    // final state = _stateSubject.value;
    try {
      final idCardInformation = await _firebaseService.getIdCardInformation();
      final decode = EncryptedUtils.decrypt(idCardInformation!.idCard);
      List<IdpModel> publicIdp = await _agentIdpDatasourceRepository.getAll();
      IdpModel selectedIdp =
          publicIdp.where((e) => e.id.trim() == item.id.trim()).first;
      print('first :1');
      List<UtilityIdpIdentifierModel> utilityPublicIdpList =
          await _firebaseService.onCallUtilityAgentIdp(
        params: PublicIdpParamModel(identifier: 1710900114896),
      );
      print(utilityPublicIdpList.length);
      if (utilityPublicIdpList.isEmpty) {
        DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
        return false;
      }
      UtilityIdpIdentifierModel filterSelectedIdpAs =
          utilityPublicIdpList.where((e) => e.nodeId == item.id.trim()).first;
      print('first :2');
      final idpName = filterSelectedIdpAs.nodeDetail.marketingNameTh;
      final selectedIndustryCode = filterSelectedIdpAs.nodeDetail.industryCode;
      final selectedCompanyCode = filterSelectedIdpAs.nodeDetail.companyCode;
      final requestMessage =
          S.current.bankNdidWaitingHeadline.replaceAll('[idp]', idpName);

      List<IdpAsModel> data = await _agentAsDatasourceRepository.getAll();
      final filterData = data.where((e) =>
          e.nodeDetail.industryCode.trim() == selectedIndustryCode.trim() &&
          e.nodeDetail.companyCode.trim() == selectedCompanyCode.trim());
      IdpAsModel selectedIdpAsData =
          (filterData.isNotEmpty) ? filterData.first : IdpAsModel();
      print('first :3');
      RpCreateRequestModel request = RpCreateRequestModel(
        identifier: decode, //mock
        idpIdList: [selectedIdp.id],
        dataRequestList: [
          DataRequestListModel(
              minAs: 1,
              serviceId: _ndidServiceRepository.serviceId02,
              asIdList: [selectedIdpAsData.nodeId])
        ],
        requestMessage: requestMessage,
      );
      print(RpCreateRequestModelPersistence().toJson(request));
      final response =
          await _firebaseService.onCallAgentCreateRequest(params: request);
      // print(NdidRefResponseModelPersistence().toJson(response));
      final updateResponse = response.copyWith({
        NdidRefResponseModelFields.type: NdidType.agent.name,
        NdidRefResponseModelFields.idpName: idpName
      });
      final result = await _firebaseService.saveTrackNdidRef(updateResponse);

      // final encodeString =
      //     jsonEncode(NdidRefResponseModelPersistence().toJson(result));
      // await _ndidServiceRepository.saveReferrence(encodeString);
      return true;
    } catch (e) {
      print(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
    }
    return false;
  }
}
