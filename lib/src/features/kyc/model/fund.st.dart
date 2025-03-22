import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/occupation.m.dart';
import 'package:aconnec_1109_x/src/model/politic_question.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycFundFormState implements IPageState<KycFundFormState> {
  int _occupationId = 0, _occupationScore = 0;
  String _salaryRange = '',
      _workingPlaceName = '',
      _anotherJobDocument = '',
      _anotherJobAssetDocument = '',
      _anotherJobSalaryRange = '';

  int _workingPlaceAddressIndex = 0;

  bool _isSubmit = false;
  bool _anotherJob = false;
  bool _uploadAnotherJobDoc = false;
  bool _uploadAnotherJobAssetDoc = false;

  String _occupation = '';

  bool _editMode = false;

  List<UserChoiceModel> _politicAnswers = [];

  int _occupationGroupId = 0;
  int _occupationGroupScore = 0;
  String _occupationGroupName = '';

  int _anotherOccupationGroupId = 0;
  int _anotherOccupationGroupScore = 0;
  String _anotherOccupationGroupName = '';
  int _anotherOccupationId = 0;
  int _anotherOccupationScore = 0;
  String _anotherOccupationName = '';

  bool _showSubOccupation = false;
  bool _showAnotherSubOccupation = false;
  bool _showSubOccupationOther = false;
  bool _showAnotherSubOccupationOther = false;

  KycFundFormState({
    int occupationId = 0,
    String salaryRange = '',
    String workingPlaceName = '',
    int workingPlaceAddressIndex = 0,
    bool isSubmit = false,
    int occupationScore = 0,
    bool anotherJob = false,
    String anotherJobDocument = '',
    String anotherJobAssetDocument = '',
    String occupation = '',
    bool uploadAnotherJobDoc = false,
    bool uploadAnotherJobAssetDoc = false,
    String anotherJobSalaryRange = '',
    bool editMode = false,
    // bool isPoliticPerson = false,
    List<UserChoiceModel> politicAnswers = const [],
    int occupationGroupId = 0,
    int occupationGroupScore = 0,
    String occupationGroupName = '',
    bool showSubOccupation = false,
    bool showAnotherSubOccupation = false,
    int anotherJobGroupId = 0,
    int anotherJobGroupScore = 0,
    String anotherJobGroupName = '',
    int anotherJobId = 0,
    int anotherJobScore = 0,
    String anotherJobName = '',
    bool showSubOccupationOther = false,
    bool showAnotherSubOccupationOther = false,
  }) {
    _occupationId = occupationId;
    _salaryRange = salaryRange;
    _workingPlaceName = workingPlaceName;
    _workingPlaceAddressIndex = workingPlaceAddressIndex;
    _isSubmit = isSubmit;
    _occupationScore = occupationScore;
    _anotherJob = anotherJob;
    _anotherJobDocument = anotherJobDocument;
    _anotherJobAssetDocument = anotherJobAssetDocument;
    _occupation = occupation;
    _uploadAnotherJobAssetDoc = uploadAnotherJobAssetDoc;
    _uploadAnotherJobDoc = uploadAnotherJobDoc;
    _anotherJobSalaryRange = anotherJobSalaryRange;
    _editMode = editMode;
    // _isPoliticPerson = isPoliticPerson;
    _politicAnswers = politicAnswers;
    _occupationGroupId = occupationGroupId;
    _occupationGroupName = occupationGroupName;
    _occupationGroupScore = occupationGroupScore;
    _showSubOccupation = showSubOccupation;
    _showAnotherSubOccupation = showAnotherSubOccupation;

    _anotherOccupationGroupId = anotherJobGroupId;
    _anotherOccupationGroupName = anotherJobGroupName;
    _anotherOccupationGroupScore = anotherJobGroupScore;
    _anotherOccupationId = anotherJobId;
    _anotherOccupationName = anotherJobName;
    _anotherOccupationScore = anotherJobScore;

    _showSubOccupationOther = showSubOccupationOther;
    _showAnotherSubOccupationOther = showAnotherSubOccupationOther;
  }

  int get occupationId => _occupationId;
  String get salaryRange => _salaryRange;
  String get workingPlaceName => _workingPlaceName;

  int get workingPlaceAddressIndex => _workingPlaceAddressIndex;

  bool get isSubmit => _isSubmit;
  int get occupationScore => _occupationScore;
  bool get anotherJob => _anotherJob;

  String get anotherJobAssetDocument => _anotherJobAssetDocument;
  String get anotherJobDocument => _anotherJobDocument;

  String get occupation => _occupation;

  bool get uploadAnotherJobDoc => _uploadAnotherJobDoc;
  bool get uploadAnotherJobAssetDoc => _uploadAnotherJobAssetDoc;

  String get anotherJobSalaryRange => _anotherJobSalaryRange;

  bool get editMode => _editMode;
  // bool get isPoliticPerson => _isPoliticPerson;

  List<UserChoiceModel> get politicAnswers => _politicAnswers;
  int get occupationGroupId => _occupationGroupId;
  int get occupationGroupScore => _occupationGroupScore;
  String get occupationGroupName => _occupationGroupName;

  bool get showSubOccupation => _showSubOccupation;
  bool get showAnotherSubOccupation => _showAnotherSubOccupation;

  int get anotherOccupationGroupId => _anotherOccupationGroupId;
  int get anotherOccupationGroupScore => _anotherOccupationGroupScore;
  String get anotherOccupationGroupName => _anotherOccupationGroupName;
  int get anotherOccupationId => _anotherOccupationId;
  int get anotherOccupationScore => _anotherOccupationScore;
  String get anotherOccupationName => _anotherOccupationName;

  bool get showSubOccupationOther => _showSubOccupationOther;
  bool get showAnotherSubOccupationOther => _showAnotherSubOccupationOther;

  @override
  KycFundFormState copyWith(Map<String, dynamic> value) {
    return KycFundFormState(
      occupationId: value[KycFundFormStateFields.occupationId] ?? _occupationId,
      salaryRange: value[KycFundFormStateFields.salaryRange] ?? _salaryRange,
      workingPlaceName:
          value[KycFundFormStateFields.workingPlaceName] ?? _workingPlaceName,
      workingPlaceAddressIndex:
          value[KycFundFormStateFields.workingPlaceAddressIndex] ??
              _workingPlaceAddressIndex,
      isSubmit: value[KycFundFormStateFields.isSubmit] ?? _isSubmit,
      anotherJob: value[KycFundFormStateFields.anotherJob] ?? _anotherJob,
      anotherJobAssetDocument:
          value[KycFundFormStateFields.anotherJobAssetDocument] ??
              _anotherJobAssetDocument,
      anotherJobDocument: value[KycFundFormStateFields.anotherJobDocument] ??
          _anotherJobDocument,
      occupation: value[KycFundFormStateFields.occupation] ?? _occupation,
      occupationScore:
          value[KycFundFormStateFields.occupationScore] ?? _occupationScore,
      anotherJobSalaryRange:
          value[KycFundFormStateFields.anotherJobSalaryRange] ??
              _anotherJobSalaryRange,
      uploadAnotherJobAssetDoc:
          value[KycFundFormStateFields.uploadAnotherJobAssetDoc] ??
              _uploadAnotherJobAssetDoc,
      uploadAnotherJobDoc: value[KycFundFormStateFields.uploadAnotherJobDoc] ??
          _uploadAnotherJobDoc,
      editMode: value[KycFundFormStateFields.editMode] ?? _editMode,
      politicAnswers:
          value[KycFundFormStateFields.politicAnswers] ?? _politicAnswers,
      occupationGroupId:
          value[KycFundFormStateFields.occupationGroupId] ?? _occupationGroupId,
      occupationGroupName: value[KycFundFormStateFields.occupationGroupName] ??
          _occupationGroupName,
      occupationGroupScore:
          value[KycFundFormStateFields.occupationGroupScore] ??
              _occupationGroupScore,
      anotherJobGroupId:
          value[KycFundFormStateFields.anotherOccupationGroupId] ??
              _anotherOccupationGroupId,
      anotherJobGroupName:
          value[KycFundFormStateFields.anotherOccupationGroupName] ??
              _anotherOccupationGroupName,
      anotherJobGroupScore:
          value[KycFundFormStateFields.anotherOccupationGroupScore] ??
              _anotherOccupationGroupScore,
      anotherJobId: value[KycFundFormStateFields.anotherOccupationId] ??
          _anotherOccupationId,
      anotherJobName: value[KycFundFormStateFields.anotherOccupationName] ??
          _anotherOccupationName,
      anotherJobScore: value[KycFundFormStateFields.anotherOccupationScore] ??
          _anotherOccupationScore,
      showSubOccupation:
          value[KycFundFormStateFields.showSubOccupation] ?? _showSubOccupation,
      showAnotherSubOccupation:
          value[KycFundFormStateFields.showAnotherSubOccupation] ??
              _showAnotherSubOccupation,
      showSubOccupationOther:
          value[KycFundFormStateFields.showSubOccupationOther] ??
              _showSubOccupationOther,
      showAnotherSubOccupationOther:
          value[KycFundFormStateFields.showAnotherSubOccupationOther] ??
              _showAnotherSubOccupationOther,
    );
  }
}

class KycFundFormStateFields {
  KycFundFormStateFields._();

  static const String occupationId = 'occupation_id';
  static const String salaryRange = 'salary_range';
  static const String workingPlaceName = 'working_placeName';
  static const String workingPlaceAddressIndex = 'working_place_address_index';
  static const String isSubmit = 'is_submit';
  static const String occupationScore = 'occupation_score';
  static const String anotherJob = 'another_job';
  static const String anotherJobDocument = 'another_job_document';
  static const String anotherJobAssetDocument = 'another_job_asset_document';
  static const String occupation = 'occupation';
  static const String uploadAnotherJobDoc = 'upload_another_job_doc';
  static const String uploadAnotherJobAssetDoc = 'upload_another_job_asset_doc';
  static const String anotherJobSalaryRange = 'another_job_salary_range';
  static const String editMode = 'edit_mode';
  // static const String isPoliticPerson = 'is_politic_person';
  static const String politicAnswers = 'politic_answers';
  static const String occupationGroupName = 'occupation_group_name';
  static const String occupationGroupScore = 'occupation_group_score';
  static const String occupationGroupId = 'occupation_group_id';
  static const String anotherOccupationGroupName =
      'anotoher_occupation_group_name';
  static const String anotherOccupationGroupScore =
      'another_occupation_group_score';
  static const String anotherOccupationGroupId = 'another_occupation_group_id';
  static const String anotherOccupationName = 'another_occupation_name';
  static const String anotherOccupationScore = 'another_occupation_score';
  static const String anotherOccupationId = 'another_occupation_id';

  static const String showSubOccupation = 'show_sub_occupation';
  static const String showAnotherSubOccupation = 'show_another_sub_occupation';
  static const String showSubOccupationOther = 'show_sub_occupation_other';
  static const String showAnotherSubOccupationOther =
      'show_another_sub_occupation_other';
}

class KycFundFormStatePersistence implements ModelJson<KycFundFormState> {
  @override
  List<KycFundFormState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  KycFundFormState fromJson(Map<String, dynamic> json) {
    return KycFundFormState(
      occupation: json[KycFundFormStateFields.occupation] ?? 'n/a',
      occupationId: json[KycFundFormStateFields.occupationId] ?? 0,
      occupationScore: json[KycFundFormStateFields.occupationScore] ?? 0,
      anotherJob: json[KycFundFormStateFields.anotherJob] ?? false,
      anotherJobSalaryRange:
          json[KycFundFormStateFields.anotherJobSalaryRange] ?? 'n/a',
      uploadAnotherJobAssetDoc:
          json[KycFundFormStateFields.uploadAnotherJobAssetDoc] ?? false,
      uploadAnotherJobDoc:
          json[KycFundFormStateFields.uploadAnotherJobDoc] ?? false,
      occupationGroupId: json[KycFundFormStateFields.occupationGroupId],
      occupationGroupName: json[KycFundFormStateFields.occupationGroupName],
      occupationGroupScore: json[KycFundFormStateFields.occupationGroupScore],
      anotherJobGroupId: json[KycFundFormStateFields.anotherOccupationGroupId],
      anotherJobGroupName:
          json[KycFundFormStateFields.anotherOccupationGroupName],
      anotherJobGroupScore:
          json[KycFundFormStateFields.anotherOccupationGroupScore],
      anotherJobId: json[KycFundFormStateFields.anotherOccupationId],
      anotherJobName: json[KycFundFormStateFields.anotherOccupationName],
      anotherJobScore: json[KycFundFormStateFields.anotherOccupationScore],
      politicAnswers: UserChoiceModelPersistence().fromArrayJson(
        json[KycFundFormStateFields.politicAnswers] ?? [],
      ),
      workingPlaceName: json[KycFundFormStateFields.workingPlaceName],
    );
  }

  @override
  Map<String, dynamic> toJson(KycFundFormState json) {
    return <String, dynamic>{
      KycFundFormStateFields.anotherOccupationGroupId:
          json.anotherOccupationGroupId,
      KycFundFormStateFields.anotherOccupationGroupName:
          json.anotherOccupationGroupName,
      KycFundFormStateFields.anotherOccupationGroupScore:
          json.anotherOccupationGroupScore,
      KycFundFormStateFields.anotherOccupationId: json.anotherOccupationId,
      KycFundFormStateFields.anotherOccupationName: json.anotherOccupationName,
      KycFundFormStateFields.anotherOccupationScore:
          json.anotherOccupationScore,
      KycFundFormStateFields.anotherJob: json.anotherJob,
      KycFundFormStateFields.uploadAnotherJobDoc: json.uploadAnotherJobDoc,
      KycFundFormStateFields.uploadAnotherJobAssetDoc:
          json.uploadAnotherJobAssetDoc,
      KycFundFormStateFields.anotherJobSalaryRange: json.anotherJobSalaryRange,
      KycFundFormStateFields.politicAnswers:
          UserChoiceModelPersistence().toArrayJson(json.politicAnswers),
      KycFundFormStateFields.occupationGroupId: json.occupationGroupId,
      KycFundFormStateFields.occupationGroupName: json.occupationGroupName,
      KycFundFormStateFields.occupationGroupScore: json.occupationGroupScore,
      KycFundFormStateFields.occupationScore: json.occupationScore,
      KycFundFormStateFields.occupation: json.occupation,
      KycFundFormStateFields.occupationId: json.occupationId,
      KycFundFormStateFields.workingPlaceName: json.workingPlaceName,
    };
  }
}

class KycWorkingAddressFormErrorState
    implements IPageState<KycWorkingAddressFormErrorState> {
  bool _hasError = false;

  KycWorkingAddressFormErrorState({
    bool hasError = false,
  }) {
    _hasError = hasError;
  }

  bool get hasError => _hasError;

  @override
  KycWorkingAddressFormErrorState copyWith(Map<String, dynamic> value) {
    return KycWorkingAddressFormErrorState(
      hasError: value[KycWorkingAddressFormErrorFields.hasError] ?? _hasError,
    );
  }
}

class KycWorkingAddressFormErrorFields {
  KycWorkingAddressFormErrorFields._();

  static const String hasError = 'hasError';
}

class KycFundFormErrorState implements IPageState<KycFundFormErrorState> {
  bool _hasError = false;

  KycFundFormErrorState({
    bool hasError = false,
  }) {
    _hasError = hasError;
  }

  bool get hasError => _hasError;

  @override
  KycFundFormErrorState copyWith(Map<String, dynamic> value) {
    return KycFundFormErrorState(
      hasError: value[KycFundFormErrorStateFields.hasError] ?? _hasError,
    );
  }
}

class KycFundFormErrorStateFields {
  KycFundFormErrorStateFields._();

  static const String hasError = 'hasError';
}

class KycFundPageState implements IPageState<KycFundPageState> {
  List<PoliticQuestionModel> _politicQuestions = [];
  List<OccupationGroupModel> _occupationGroups = [];
  List<OccupationListItemModel> _occupationListItems = [];

  KycFundPageState({
    List<PoliticQuestionModel> politicQuestions = const [],
    List<OccupationGroupModel> occupationGroups = const [],
    List<OccupationListItemModel> occupationListItems = const [],
  }) {
    _politicQuestions = politicQuestions;
    _occupationGroups = occupationGroups;
    _occupationListItems = occupationListItems;
  }

  List<PoliticQuestionModel> get politicQuestions => _politicQuestions;
  List<OccupationGroupModel> get occupationGroups => _occupationGroups;
  List<OccupationListItemModel> get occupationListItems => _occupationListItems;

  @override
  KycFundPageState copyWith(Map<String, dynamic> value) {
    return KycFundPageState(
      politicQuestions:
          value[KycFundPageStateFields.politicQuestions] ?? _politicQuestions,
      occupationGroups:
          value[KycFundPageStateFields.occupationGroups] ?? _occupationGroups,
      occupationListItems: value[KycFundPageStateFields.occupationListItems] ??
          _occupationListItems,
    );
  }
}

class KycFundPageStateFields {
  KycFundPageStateFields._();
  static const String politicQuestions = 'politic_questions';
  static const String occupationGroups = 'occupation_groups';
  static const String occupationListItems = 'occupation_list_items';
}
