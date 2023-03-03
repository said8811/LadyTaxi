import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/register_cubit/register_user_state.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/repository/register_repos/login_repository.dart';

class UserRegisterCubit extends Cubit<UserRegisterState> {
  UserRegisterCubit({required this.repository}) : super(UserRegisterInLoad());
  RegisterRepository repository;
  register(String fullName, String gender, String token) async {
    AppResponse myResponse =
        await repository.registerUser(fullName, gender, token);
    if (myResponse.errorTxt.isEmpty) {
      emit(UserRegisterInSucces(user: myResponse.data));
    } else {
      emit(UserRegisterInError(errorTxt: myResponse.errorTxt));
    }
  }
}
