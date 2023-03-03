class UserModel {
  String? id;
  String? fullName;
  String? gender;
  String? phoneNumber;
  String? refreshToken;
  String? accessToken;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  UserModel(
      {this.id,
      this.fullName,
      this.gender,
      this.phoneNumber,
      this.refreshToken,
      this.accessToken,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    refreshToken = json['refresh_token'];
    accessToken = json['access_token'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
}
