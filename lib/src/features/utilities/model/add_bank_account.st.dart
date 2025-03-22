import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class AddBankAccountPageState implements IPageState<AddBankAccountPageState> {
  bool _isLoading = false;

  AddBankAccountPageState({bool isLoading = false}) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;

  @override
  AddBankAccountPageState copyWith(Map<String, dynamic> value) {
    return AddBankAccountPageState(
      isLoading: value[AddBankAccountPageStateFiedls.isLoading] ?? _isLoading,
    );
  }
}

class AddBankAccountPageStateFiedls {
  AddBankAccountPageStateFiedls._();

  static const String isLoading = 'isLoading';
}

class AddBankAccountFormState implements IPageState<AddBankAccountFormState> {
  String _bankAccountName = '';
  String _bankAccountNumber = '';
  String _bankAccountBranch = '';
  String _bankName = '';
  bool _uploadBookBank = false;
  String _bookBankImagePath = '';
  String _status = '';
  String _bankCode = '';

  AddBankAccountFormState({
    String bankAccountName = '',
    String bankAccountNumber = '',
    String bankAccountBranch = '',
    String bankName = '',
    bool uploadBookBank = false,
    String bookBankImagePath = '',
    String status = '',
    String bankCode = '',
  }) {
    _bankAccountName = bankAccountName;
    _bankAccountNumber = bankAccountNumber;
    _bankAccountBranch = bankAccountBranch;
    _bankName = bankName;
    _uploadBookBank = uploadBookBank;
    _bookBankImagePath = bookBankImagePath;
    _status = status;
    _bankCode = bankCode;
  }

  String get bankAccountName => _bankAccountName;
  String get bankAccountNumber => _bankAccountNumber;
  String get bankAccountBranch => _bankAccountBranch;
  String get bankName => _bankName;
  bool get uploadBookBank => _uploadBookBank;
  String get bookBankImagePath => _bookBankImagePath;
  String get status => _status;
  String get bankCode => _bankCode;

  @override
  AddBankAccountFormState copyWith(Map<String, dynamic> value) {
    return AddBankAccountFormState(
      bankAccountName: value[AddBankAccountFormStateFields.bankAccountName] ??
          _bankAccountName,
      bankAccountNumber:
          value[AddBankAccountFormStateFields.bankAccountNumber] ??
              _bankAccountNumber,
      bankAccountBranch:
          value[AddBankAccountFormStateFields.bankAccountBranch] ??
              _bankAccountBranch,
      bankName: value[AddBankAccountFormStateFields.bankName] ?? _bankName,
      uploadBookBank: value[AddBankAccountFormStateFields.uploadBookBank] ??
          _uploadBookBank,
      bookBankImagePath: value[AddBankAccountFormStateFields.bookBankImage] ??
          _bookBankImagePath,
      status: value[AddBankAccountFormStateFields.status] ?? _status,
      bankCode: value[AddBankAccountFormStateFields.bankCode] ?? _bankCode,
    );
  }
}

class AddBankAccountFormStateFields {
  AddBankAccountFormStateFields._();

  static const String bankAccountName = 'bank_account_name';
  static const String bankAccountNumber = 'bank_account_number';
  static const String bankAccountBranch = 'branch_code';
  static const String bankName = 'bank_name';
  static const String bookBankImage = 'book_bank_selected_path';
  static const String uploadBookBank = 'upload_book_bank';
  static const String status = 'bank_status';
  static const String bankCode = 'bank_code';
  static const String bookBankStoragePath = 'book_bank_storage_path';
}

class AddBankAccountFormStatePersistence
    implements ModelJson<AddBankAccountFormState> {
  @override
  List<AddBankAccountFormState> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  AddBankAccountFormState fromJson(Map<String, dynamic> json) {
    return AddBankAccountFormState(
      bankAccountName:
          json[AddBankAccountFormStateFields.bankAccountName] ?? '',
      bankAccountBranch:
          json[AddBankAccountFormStateFields.bankAccountBranch] ?? '',
      bankAccountNumber:
          json[AddBankAccountFormStateFields.bankAccountNumber] ?? '',
      uploadBookBank:
          json[AddBankAccountFormStateFields.uploadBookBank] ?? false,
      bankName: json[AddBankAccountFormStateFields.bankName] ?? '',
      bookBankImagePath:
          json[AddBankAccountFormStateFields.bookBankStoragePath] ?? '',
      status: json[AddBankAccountFormStateFields.status] ?? '',
      bankCode: json[AddBankAccountFormStateFields.bankCode] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(AddBankAccountFormState json) {
    return {
      AddBankAccountFormStateFields.bankAccountName: json.bankAccountName,
      AddBankAccountFormStateFields.bankAccountBranch: json.bankAccountBranch,
      AddBankAccountFormStateFields.bankAccountNumber: json.bankAccountNumber,
      AddBankAccountFormStateFields.bankName: json.bankName,
      AddBankAccountFormStateFields.status: json.status,
      AddBankAccountFormStateFields.bankCode: json.bankCode,
    };
  }

  List<Map<String, dynamic>> toArrayJson(
      List<AddBankAccountFormState> arrJson) {
    return arrJson.map((e) => toJson(e)).toList();
  }
}
