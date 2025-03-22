import 'dart:convert';

import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/request_user_bank_account.m.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';

class UserProfileModelPersistence implements ModelJson<UserProfileModel> {
  @override
  List<UserProfileModel> fromArrayJson(List<dynamic> arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  UserProfileModel fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json[UserProfileModelFields.userId] ?? 0,
      uid: json[UserProfileModelFields.idFirebase] ?? '',
      actionSetPin: json[UserProfileModelFields.pinActiveStatus] ?? 0,
      pin: json[UserProfileModelFields.pinData] ?? '',
      username: json[UserProfileModelFields.profileName] ?? '',
      kycLevel: json[UserProfileModelFields.kycLevel] ?? 0,
      bankAccount: List.from(json[UserProfileModelFields.bankAccount] ?? [])
          .map((e) =>
              UserBankAccountModel.fromJson(Map<String, String?>.from(e)))
          .toList(),
      createdAt: json[UserProfileModelFields.userCreatedAt] ?? '',
      status: json[UserProfileModelFields.userActiveStatus] ?? '',
      kycStatus: json[UserProfileModelFields.kycStatus] ?? '',
      mobileNumber: json[UserProfileModelFields.userMobileNumber] ?? '',
      lastUpdate: json[UserProfileModelFields.userLastUpdate] ?? '',
      customerStatus: json[UserProfileModelFields.customerStatus] ?? '',
      dealerCustomerStatus:
          json[UserProfileModelFields.dealerCustomerStatus] ?? '',
      profilePicture: json[UserProfileModelFields.profilePicture] ?? '',
      userEmail: json[UserProfileModelFields.userEmail] ?? '',
      userType: json[UserProfileModelFields.userType] ?? '',
      pinReset: json[UserProfileModelFields.pinReset] ?? false,
      businessType: json[UserProfileModelFields.businessType] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(UserProfileModel json) {
    return <String, dynamic>{
      UserProfileModelFields.userId: json.id,
      UserProfileModelFields.idFirebase: json.uid,
      UserProfileModelFields.pinActiveStatus: json.actionSetPin,
      UserProfileModelFields.pinData: json.pin,
      UserProfileModelFields.profileName: json.username,
      UserProfileModelFields.kycLevel: json.kycLevel,
      UserProfileModelFields.bankAccount:
          json.bankAccount.map((e) => e.toJson()).toList(),
      UserProfileModelFields.userCreatedAt: json.createdAt,
      UserProfileModelFields.userActiveStatus: json.status,
      UserProfileModelFields.kycStatus: json.kycStatus,
      UserProfileModelFields.userMobileNumber: json.mobileNumber,
      UserProfileModelFields.userType: json.userType,
      UserProfileModelFields.userEmail: json.userEmail,
      UserProfileModelFields.customerStatus: json.customerStatus,
      UserProfileModelFields.dealerCustomerStatus: json.dealerCustomerStatus,
      UserProfileModelFields.pinReset: json.pinReset,
      UserProfileModelFields.userLastUpdate: json.lastUpdate,
      UserProfileModelFields.profilePicture: json.profilePicture,
      UserProfileModelFields.businessType: json.businessType,
    };
  }

  //currently, not save in local
  Map<String, dynamic> toLocalData(UserProfileModel json) {
    return <String, dynamic>{
      'uid': json.uid,
      'actionSetPin': json.actionSetPin,
      'pin': json.pin,
      'username': json.username,
      UserProfileModelFields.kycLevel: json.kycLevel,
      UserProfileModelFields.bankAccount: json.bankAccount,
      UserProfileModelFields.userCreatedAt: json.createdAt,
      UserProfileModelFields.userActiveStatus: json.status,
      UserProfileModelFields.kycStatus: json.kycStatus,
      UserProfileModelFields.userMobileNumber: json.mobileNumber,
    };
  }

  //currently, not save in local
  UserProfileModel fromMapLocalData(Map<dynamic, dynamic> json) {
    return UserProfileModel(
      id: json['id'] ?? 0,
      uid: json['uid'] ?? '',
      actionSetPin: json['actionSetPin'] ?? 0,
      pin: json['pin'] ?? '',
      username: json['username'] ?? '',
      kycLevel: json[UserProfileModelFields.kycLevel] ?? 0,
      bankAccount: List.from(json[UserProfileModelFields.bankAccount] ?? [])
          .map((e) => UserBankAccountModel.fromJson(e))
          .toList(),
      createdAt: json[UserProfileModelFields.userCreatedAt] ?? '',
      status: json[UserProfileModelFields.userActiveStatus] ?? '',
      kycStatus: json[UserProfileModelFields.kycStatus] ?? '',
      mobileNumber: json[UserProfileModelFields.userMobileNumber] ?? '',
    );
  }
}
