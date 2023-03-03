import 'package:lady_taxi/data/models/register_models/verify_model.dart';

abstract class VerifyState {}

class VerifyInLoading extends VerifyState {}

class VerifyInError extends VerifyState {
  String errorTxt;
  VerifyInError({required this.errorTxt});
}

class VerifyInSucces extends VerifyState {
  VerifyInSucces({required this.verifyModel});
  UserModel verifyModel;
}
