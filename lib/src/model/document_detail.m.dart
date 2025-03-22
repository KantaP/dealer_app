import 'package:aconnec_1109_x/src/model/model.abs.dart';

class DocumentDetailModel implements Model<DocumentDetailModel> {
  String _path = '';
  String _createdAt = '';
  String _updatedAt = '';

  DocumentDetailModel({
    String path = '',
    String createdAt = '',
    String updatedAt = '',
  }) {
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _path = path;
  }

  String get path => _path;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  @override
  DocumentDetailModel copyWith(Map<String, dynamic> value) {
    return DocumentDetailModel(
      path: value[DocumentDetailModelFields.path] ?? _path,
      createdAt: value[DocumentDetailModelFields.createdAt] ?? _createdAt,
      updatedAt: value[DocumentDetailModelFields.updatedAt] ?? _updatedAt,
    );
  }
}

class DocumentDetailModelFields {
  DocumentDetailModelFields._();

  static const String path = 'path';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
}
