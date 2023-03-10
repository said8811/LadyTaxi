import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/login_cubit/login_state.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/repository/register_repos/login_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.repository}) : super(RegisterInLoad());
  RegisterRepository repository;
  login(String number) async {
    emit(RegisterInLoad());
    AppResponse myResponse = await repository.login(number);
    if (myResponse.errorTxt.isEmpty) {
      emit(RegisterInSucces());
    } else {
      emit(RegisterInError(errorTxt: myResponse.errorTxt));
    }
  }
}
