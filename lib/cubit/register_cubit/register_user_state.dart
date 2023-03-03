import 'package:lady_taxi/data/models/register_models/verify_model.dart';

abstract class UserRegisterState {}

class UserRegisterInLoad extends UserRegisterState {}

class UserRegisterInError extends UserRegisterState {
  UserRegisterInError({required this.errorTxt});
  String errorTxt;
}

class UserRegisterInSucces extends UserRegisterState {
  UserRegisterInSucces({required this.user});
  UserModel user;
}
