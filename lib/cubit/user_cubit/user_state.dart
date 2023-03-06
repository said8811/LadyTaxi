import 'package:lady_taxi/data/models/register_models/verify_model.dart';

abstract class UserState {}

class UserStateInSucces extends UserState {
  UserStateInSucces({required this.user});
  UserModel user;
}

class UserStateInLoad extends UserState {}

class UserStateInError extends UserState {
  UserStateInError({required this.errorTxt});
  String errorTxt;
}
