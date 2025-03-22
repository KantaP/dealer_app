import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/data/repositories/idpAsDatasource.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/idpDatasource.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/ndidService.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/utilityPublicIdpDatasource.repo.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/bank_ndid.st.dart';
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
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.p.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class BankNdidViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  final IdpDatasouceRepository _idpDatasouceRepository;
  final IdpAsDatasouceRepository _idpAsDatasouceRepository;
  final NdidServiceRepository _ndidServiceRepository;
  final UtilityPublicIdpDatasourceRepository
      _utilityPublicIdpDatasourceRepository;
  BankNdidViewModel(
    this._firebaseService,
    this._idpDatasouceRepository,
    this._idpAsDatasouceRepository,
    this._ndidServiceRepository,
    this._utilityPublicIdpDatasourceRepository,
  );

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _initialExpansionItems = [
    BankNdidExpansionModel(
      index: 0,
      isExpanded: true,
    ),
    BankNdidExpansionModel(
      index: 1,
      isExpanded: true,
    )
  ];

  final stateSubject = BehaviorSubject<BankNdidPageState>.seeded(
    BankNdidPageState(
      expansionItems: [
        BankNdidExpansionModel(
          index: 0,
          isExpanded: true,
        ),
        BankNdidExpansionModel(
          index: 1,
          isExpanded: false,
        )
      ],
    ),
  );
  Stream<BankNdidPageState> get state => stateSubject;

  late KycFinalViewModel _kycLevel2ViewModel;

  final logger = Logger('bank_ndid_viewmodel');

  List<UtilityIdpIdentifierModel> registerUtilityPublicIdpList = [];
  List<UtilityIdpIdentifierModel> allUtilityPublicIdpList = [];

  bool selectedUnregister = false;

  @override
  void dispose() {
    _routesSubject.close();
    stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = stateSubject.value;
    stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void setKycLevel2ViewModel(KycFinalViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  void expansionCallback(int index, bool isExpanded) {
    final state = stateSubject.value;
    final expansion = state.expansionItems;

    updateState({
      BankNdidPageStateFields.expansionItems: expansion.map((e) {
        BankNdidExpansionModel item = e;
        if (item.index == index) {
          item = item
              .copyWith({BankNdidExpansionModelFields.isExpanded: !isExpanded});
        }
        return item;
      }).toList(),
    });
  }

  void toggle(int index) {
    final state = stateSubject.value;
    final expansion = state.expansionItems;

    updateState({
      BankNdidPageStateFields.expansionItems: expansion.map((e) {
        BankNdidExpansionModel item = e;
        if (item.index == index) {
          item = item.copyWith(
            {
              BankNdidExpansionModelFields.isExpanded:
                  !expansion[index].isExpanded
            },
          );
        }
        return item;
      }).toList(),
    });
  }

  Future<void> getIdpList() async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });

    try {
      final idCardInformation = await _firebaseService.getIdCardInformation();
      final decode = EncryptedUtils.decrypt(idCardInformation!.idCard);
      List<IdpModel> publicIdp = await _idpDatasouceRepository.getAll();
      List<IdpModel> registerData = [];
      registerUtilityPublicIdpList =
          await _firebaseService.onCallUtilityPublicIdp(
        params: PublicIdpParamModel(identifier: int.parse(decode)),
      );

      allUtilityPublicIdpList =
          await _utilityPublicIdpDatasourceRepository.getAll();
      try {
        final ndidRegistered =
            registerUtilityPublicIdpList.map((e) => e.nodeId).toList();
        registerData =
            publicIdp.where((e) => ndidRegistered.contains(e.id)).toList();

        // for (var element in registerUtilityPublicIdpList) {
        //   logger.info(UtilityIdpIdentifierModelPersistence().toJson(element));
        // }

        updateState({
          BankNdidPageStateFields.ndidBankRegister: registerData,
        });
      } catch (e) {
        //Sentry.captureException(e);
        _kycLevel2ViewModel.updateState({
          KycLevel2PageStateFields.isLoading: false,
        });
      }

      try {
        List<IdpModel> data = publicIdp;
        final idpOnTheFlySupport = allUtilityPublicIdpList
            .where((e) => e.onTheFlySupport == true)
            .map((e) => e.nodeId)
            .toList();
        for (var item in allUtilityPublicIdpList) {
          logger.info(UtilityIdpIdentifierModelPersistence().toJson(item));
        }
        if (registerData.isNotEmpty) {
          data = data.where((e) => !registerData.contains(e)).toList();
        }
        data = data.where((e) => idpOnTheFlySupport.contains(e.id)).toList();

        updateState({
          BankNdidPageStateFields.ndidBankUnRegister: data,
        });
      } catch (e) {
        //Sentry.captureException(e);
        _kycLevel2ViewModel.updateState({
          KycLevel2PageStateFields.isLoading: false,
        });
      }
    } catch (e) {
      //Sentry.captureException(e);
      _kycLevel2ViewModel.updateState({
        KycLevel2PageStateFields.isLoading: true,
      });
    }

    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: false,
    });
  }

  Future<void> next() async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });

    final result = await sendRequest();
    if (result) {
      final kycProgress = await _firebaseService.getKycProgress();
      final updateProgress = kycProgress.copyWith({
        KycFinalPageStateFields.thirdStepProgress:
            KycPageNames.ndidWatingIdp.name
      });
      try {
        await _firebaseService.addNdidAttempt();
      } on Exception {
        _kycLevel2ViewModel.updateState({
          KycLevel2PageStateFields.isLoading: false,
        });
        return;
      }
      await _firebaseService.setKycProgress(updateProgress);
      await _firebaseService.updateKycStatus(StaticValue.kycStep3NDIDReview);
      _kycLevel2ViewModel.updateState({
        KycLevel2PageStateFields.isLoading: false,
      });
    } else {
      _kycLevel2ViewModel.updateState({
        KycLevel2PageStateFields.isLoading: false,
      });
    }
  }

  Future<bool> sendRequest() async {
    try {
      final state = stateSubject.value;
      List<IdpModel> publicIdp = await _idpDatasouceRepository.getAll();
      IdpModel selectedIdp = publicIdp
          .where((e) => e.id.trim() == state.selectedIdItem.trim())
          .first;
      // print(state.selectedIdItem);
      List whereSelected = registerUtilityPublicIdpList
          .where((e) => e.nodeId == state.selectedIdItem.trim())
          .toList();

      UtilityIdpIdentifierModel? filterSelectedIdpAs =
          (whereSelected.isNotEmpty) ? whereSelected.first : null;
      // print(filterSelectedIdpAs);
      if (filterSelectedIdpAs == null) {
        selectedUnregister = true;
        whereSelected = allUtilityPublicIdpList
            .where((e) => e.nodeId == state.selectedIdItem.trim())
            .toList();
        filterSelectedIdpAs =
            (whereSelected.isNotEmpty) ? whereSelected.first : null;
      }

      if (filterSelectedIdpAs == null) {
        return false;
      }

      // print(UtilityIdpIdentifierModelPersistence().toJson(filterSelectedIdpAs));

      final idcardInformation = await _firebaseService.getIdCardInformation();
      final decode = EncryptedUtils.decrypt(idcardInformation!.idCard);

      final idpName = filterSelectedIdpAs.nodeDetail.marketingNameTh;
      final selectedIndustryCode = filterSelectedIdpAs.nodeDetail.industryCode;
      final selectedCompanyCode = filterSelectedIdpAs.nodeDetail.companyCode;
      final requestMessage =
          S.current.bankNdidWaitingHeadline.replaceAll('[idp]', idpName);

      List<IdpAsModel> data = await _idpAsDatasouceRepository.getAll();
      final filterData = data.where((e) =>
          e.nodeDetail.industryCode.trim() == selectedIndustryCode.trim() &&
          e.nodeDetail.companyCode.trim() == selectedCompanyCode.trim());
      IdpAsModel selectedIdpAsData =
          (filterData.isNotEmpty) ? filterData.first : IdpAsModel();

      // print(IdpAsModelPersistence().toJson(selectedIdpAsData));
      RpCreateRequestModel request = RpCreateRequestModel(
        identifier: decode, //mock
        idpIdList: [selectedIdp.id],
        dataRequestList: [
          DataRequestListModel(
            minAs: 1,
            serviceId: _ndidServiceRepository.serviceId01,
            asIdList: [selectedIdpAsData.nodeId],
          )
        ],
        requestMessage: requestMessage,
        byPass: (selectedUnregister == true) ? true : false,
      );
      print(RpCreateRequestModelPersistence().toJson(request));

      final response =
          await _firebaseService.onCallPublicCreateRequest(params: request);

      final updateResponse = response.copyWith({
        NdidRefResponseModelFields.type: NdidType.public.name,
        NdidRefResponseModelFields.idpName: idpName,
      });
      if (updateResponse.requestId.isEmpty) {
        throw Exception('REQUEST_ID_EMPTY');
      }
      final result = await _firebaseService.saveTrackNdidRef(updateResponse);

      // final encodeString =
      //     jsonEncode(NdidRefResponseModelPersistence().toJson(result));
      // await _ndidServiceRepository.saveReferrence(encodeString);

      return true;
    } catch (e) {
      print(e);
      DialogUtils.showToast(msg: e.toString(), type: 'error');
    }
    return false;
  }
}
