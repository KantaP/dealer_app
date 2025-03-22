import 'package:aconnec_1109_x/src/model/document_detail.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class DocumentDetailModelPersistence implements ModelJson<DocumentDetailModel> {
  @override
  List<DocumentDetailModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  DocumentDetailModel fromJson(Map<String, dynamic> json) {
    return DocumentDetailModel(
      path: json[DocumentDetailModelFields.path] ?? '',
      createdAt: json[DocumentDetailModelFields.createdAt] ?? '',
      updatedAt: json[DocumentDetailModelFields.updatedAt] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(DocumentDetailModel json) {
    return {
      DocumentDetailModelFields.path: json.path,
      DocumentDetailModelFields.createdAt: json.createdAt,
      DocumentDetailModelFields.updatedAt: json.updatedAt,
    };
  }
}
