import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/user_cubit/user_state.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';
import 'package:lady_taxi/data/repository/user_repository/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.repository}) : super(UserStateInLoad());
  UserRepository repository;
  register(String id, String token) async {
    AppResponse myResponse = await repository.getUser(id, token);
    if (myResponse.errorTxt.isEmpty) {
      emit(UserStateInSucces(user: myResponse.data as UserModel));
    } else {
      emit(UserStateInError(errorTxt: myResponse.errorTxt));
    }
  }
}
