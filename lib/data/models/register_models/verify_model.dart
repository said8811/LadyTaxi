class UserModel {
  String id;
  String fullName;
  String gender;
  String phoneNumber;
  String refreshToken;
  String accessToken;
  bool isActive;
  String createdAt;
  String updatedAt;
  String deletedAt;

  UserModel(
      {required this.id,
      required this.fullName,
      required this.gender,
      required this.phoneNumber,
      required this.refreshToken,
      required this.accessToken,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? "",
      fullName: json['full_name'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      phoneNumber: json['phone_number'] as String? ?? "",
      refreshToken: json['refresh_token'] as String? ?? "",
      accessToken: json['access_token'] as String? ?? "",
      isActive: json['is_active'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      deletedAt: json['deleted_at'] as String? ?? "",
    );
  }
}
