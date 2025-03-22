import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/request_user_bank_account.m.dart';

class UserProfileModel implements Model<UserProfileModel> {
  int _id = 0;
  String _uid = '';
  int _actionSetPin = 0;
  String _pin = '';
  String _username = '';
  int _kycLevel = 0;
  List<UserBankAccountModel> _bankAccount = [];
  String _createdAt = '';
  String _status = '';
  String _kycStatus = '';
  String _mobileNumber = '';
  String _customerStatus = '';
  String _dealerCustomerStatus = '';
  String _lastUpdate = '';
  String _profilePicture = '';
  String _userType = '';
  String _userEmail = '';
  String _businessType = '';

  bool _pinReset = false;

  UserProfileModel({
    int id = 0,
    String uid = '',
    int actionSetPin = 0,
    String pin = '',
    String username = '',
    int kycLevel = 0,
    List<UserBankAccountModel> bankAccount = const [],
    String createdAt = '',
    String status = '',
    String kycStatus = '',
    String mobileNumber = '',
    String customerStatus = '',
    String dealerCustomerStatus = '',
    String profilePicture = '',
    String userType = '',
    String userEmail = '',
    String lastUpdate = '',
    bool pinReset = false,
    String businessType = '',
  }) {
    _id = id;
    _uid = uid;
    _actionSetPin = actionSetPin;
    _pin = pin;
    _username = username;
    _kycLevel = kycLevel;
    _bankAccount = bankAccount;
    _createdAt = createdAt;
    _status = status;
    _kycStatus = kycStatus;
    _mobileNumber = mobileNumber;
    _customerStatus = customerStatus;
    _dealerCustomerStatus = dealerCustomerStatus;
    _profilePicture = profilePicture;
    _userEmail = userEmail;
    _userType = userType;
    _lastUpdate = lastUpdate;
    _pinReset = pinReset;
    _businessType = businessType;
  }

  int get id => _id;
  String get uid => _uid;
  int get actionSetPin => _actionSetPin;
  String get pin => _pin;
  String get username => _username;
  int get kycLevel => _kycLevel;
  List<UserBankAccountModel> get bankAccount => _bankAccount;
  String get createdAt => _createdAt;
  String get status => _status;
  String get kycStatus => _kycStatus;
  String get mobileNumber => _mobileNumber;
  String get customerStatus => _customerStatus;
  String get dealerCustomerStatus => _dealerCustomerStatus;
  String get profilePicture => _profilePicture;
  String get userEmail => _userEmail;
  String get userType => _userType;
  String get lastUpdate => _lastUpdate;
  bool get pinReset => _pinReset;
  String get businessType => _businessType;

  void setId(int id) {
    _id = id;
  }

  @override
  UserProfileModel copyWith(Map<String, dynamic> value) {
    return UserProfileModel(
      id: value[UserProfileModelFields.userId] ?? _id,
      uid: value[UserProfileModelFields.idFirebase] ?? _uid,
      actionSetPin:
          value[UserProfileModelFields.pinActiveStatus] ?? _actionSetPin,
      pin: value[UserProfileModelFields.pinData] ?? _pin,
      username: value[UserProfileModelFields.profileName] ?? _username,
      kycLevel: value[UserProfileModelFields.kycLevel] ?? _kycLevel,
      bankAccount: value[UserProfileModelFields.bankAccount] ?? _bankAccount,
      createdAt: value[UserProfileModelFields.userCreatedAt] ?? _createdAt,
      status: value[UserProfileModelFields.userActiveStatus] ?? _status,
      kycStatus: value[UserProfileModelFields.kycStatus] ?? _kycStatus,
      mobileNumber:
          value[UserProfileModelFields.userMobileNumber] ?? _mobileNumber,
      customerStatus:
          value[UserProfileModelFields.customerStatus] ?? _customerStatus,
      dealerCustomerStatus:
          value[UserProfileModelFields.dealerCustomerStatus] ??
              _dealerCustomerStatus,
      userType: value[UserProfileModelFields.userType] ?? _userType,
      userEmail: value[UserProfileModelFields.userEmail] ?? _userEmail,
      lastUpdate: value[UserProfileModelFields.userLastUpdate] ?? _lastUpdate,
      pinReset: value[UserProfileModelFields.pinReset] ?? _pinReset,
      businessType: value[UserProfileModelFields.businessType] ?? _businessType,
    );
  }
}

class UserProfileModelFields {
  UserProfileModelFields._();
  static const String userId = 'customer_id';
  static const String idFirebase = 'id_firebase';
  static const String pinActiveStatus = 'pin_activestatus';
  static const String pinData = 'pin_data';
  static const String profileName = 'profile_name';
  static const String kycLevel = 'kyc_level';
  static const String bankAccount = 'bank_accounts';
  static const String userCreatedAt = 'user_created_at';
  static const String userActiveStatus = 'user_active_status';
  static const String kycStatus = 'kyc_status';
  static const String userMobileNumber = 'mobile';
  static const String profilePicture = 'profile_picture';
  static const String userType = 'user_type';
  static const String userEmail = 'email';
  static const String userLastUpdate = 'user_last_update';
  static const String pinReset = 'pin_reset';
  static const String customerStatus = 'customer_status';
  static const String dealerCustomerStatus = 'dealer_customer_status';
  static const String businessType = 'business_type';
}
