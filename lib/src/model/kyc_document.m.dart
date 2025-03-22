import 'package:aconnec_1109_x/src/model/model.abs.dart';

import 'document_detail.m.dart';

class KycDocumentsModel implements Model<KycDocumentsModel> {
  DocumentDetailModel? _frontIdCardPath;
  DocumentDetailModel? _backIdCardPath;
  DocumentDetailModel? _selfiePath;
  DocumentDetailModel? _selfieWithId;
  DocumentDetailModel? _anotherJobDoc;
  DocumentDetailModel? _anotherJobDocAsset;

  KycDocumentsModel({
    DocumentDetailModel? frontIdCardPath,
    DocumentDetailModel? backIdCardPath,
    DocumentDetailModel? selfiePath,
    DocumentDetailModel? selfieWithId,
    DocumentDetailModel? anotherJobDoc,
    DocumentDetailModel? anotherJobDocAsset,
  }) {
    _frontIdCardPath = frontIdCardPath;
    _backIdCardPath = backIdCardPath;
    _selfiePath = selfiePath;
  }

  DocumentDetailModel? get frontIdCardPath => _frontIdCardPath;
  DocumentDetailModel? get backIdCardPath => _backIdCardPath;
  DocumentDetailModel? get selfiePath => _selfiePath;

  @override
  KycDocumentsModel copyWith(Map<String, dynamic> value) {
    return KycDocumentsModel(
      frontIdCardPath:
          value[KycDocumentsModelFields.frontIdCardPath] ?? _frontIdCardPath,
      backIdCardPath:
          value[KycDocumentsModelFields.backIdCardPath] ?? _backIdCardPath,
      selfiePath: value[KycDocumentsModelFields.selfiePath] ?? _selfiePath,
    );
  }
}

class KycDocumentsModelFields {
  KycDocumentsModelFields._();

  static const String frontIdCardPath = 'front_id_card';
  static const String backIdCardPath = 'back_id_card';
  static const String selfiePath = 'selfie';
  static const String selfieWithIdCardPath = 'selfie_with_id';
  static const String anotherJobDoc = 'another_job_doc';
  static const String anotherJobDocAsset = 'another_job_doc_asset';
}
