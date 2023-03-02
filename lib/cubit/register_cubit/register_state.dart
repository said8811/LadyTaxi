abstract class RegisterState {}

class RegisterInLoad extends RegisterState {}

class RegisterInError extends RegisterState {
  RegisterInError({required this.errorTxt});
  String errorTxt;
}

class RegisterInSucces extends RegisterState {}
