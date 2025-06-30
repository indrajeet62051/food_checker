// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final Data? data;
  final String? msg;
  final int? status;

  User({this.data, this.msg, this.status});

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "msg": msg,
    "status": status,
  };
}

class Data {
  final int? userId;
  final String? userToken;
  final String? fullName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? userProfilePhoto;
  final String? userType;
  final int? selectedBranchId;
  final int? restaurantUserId;
  final String? staffRole;
  final String? staffDepartment;
  final int? latitude;
  final int? longitude;
  final String? socialId;
  final String? loginType;
  final String? authToken;
  final String? devicePushToken;
  final String? deviceType;
  final String? timeZone;
  final String? languageCode;
  final int? isNotificationOn;
  final String? verifyEmail;
  final String? verifyEmailCode;
  final String? verifyForgotCode;
  final int? badge;
  final int? isLoggedOut;
  final String? createdDate;
  final int? branchCount;

  Data({
    this.userId,
    this.userToken,
    this.fullName,
    this.firstName,
    this.lastName,
    this.email,
    this.userProfilePhoto,
    this.userType,
    this.selectedBranchId,
    this.restaurantUserId,
    this.staffRole,
    this.staffDepartment,
    this.latitude,
    this.longitude,
    this.socialId,
    this.loginType,
    this.authToken,
    this.devicePushToken,
    this.deviceType,
    this.timeZone,
    this.languageCode,
    this.isNotificationOn,
    this.verifyEmail,
    this.verifyEmailCode,
    this.verifyForgotCode,
    this.badge,
    this.isLoggedOut,
    this.createdDate,
    this.branchCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    userToken: json["user_token"],
    fullName: json["full_name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    userProfilePhoto: json["user_profile_photo"],
    userType: json["user_type"],
    selectedBranchId: json["selected_branch_id"],
    restaurantUserId: json["restaurant_user_id"],
    staffRole: json["staff_role"],
    staffDepartment: json["staff_department"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    socialId: json["social_id"],
    loginType: json["login_type"],
    authToken: json["auth_token"],
    devicePushToken: json["device_push_token"],
    deviceType: json["device_type"],
    timeZone: json["time_zone"],
    languageCode: json["language_code"],
    isNotificationOn: json["is_notification_on"],
    verifyEmail: json["verify_email"],
    verifyEmailCode: json["verify_email_code"],
    verifyForgotCode: json["verify_forgot_code"],
    badge: json["badge"],
    isLoggedOut: json["is_logged_out"],
    createdDate: json["created_date"],
    branchCount: json["branch_count"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_token": userToken,
    "full_name": fullName,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "user_profile_photo": userProfilePhoto,
    "user_type": userType,
    "selected_branch_id": selectedBranchId,
    "restaurant_user_id": restaurantUserId,
    "staff_role": staffRole,
    "staff_department": staffDepartment,
    "latitude": latitude,
    "longitude": longitude,
    "social_id": socialId,
    "login_type": loginType,
    "auth_token": authToken,
    "device_push_token": devicePushToken,
    "device_type": deviceType,
    "time_zone": timeZone,
    "language_code": languageCode,
    "is_notification_on": isNotificationOn,
    "verify_email": verifyEmail,
    "verify_email_code": verifyEmailCode,
    "verify_forgot_code": verifyForgotCode,
    "badge": badge,
    "is_logged_out": isLoggedOut,
    "created_date": createdDate,
    "branch_count": branchCount,
  };
}
