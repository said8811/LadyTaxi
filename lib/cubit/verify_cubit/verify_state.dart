abstract class VerifyState {}

class VerifyInLoading extends VerifyState {}

class VerifyInError extends VerifyState {
  String errorTxt;
  VerifyInError({required this.errorTxt});
}

class VerifyInSucces extends VerifyState {}
