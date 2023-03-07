import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/verify_cubit/verify_state.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';
import 'package:lady_taxi/data/repository/register_repos/login_repository.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit({required this.registerRepository}) : super(VerifyInLoading());
  RegisterRepository registerRepository;
  verify(String number, String code) async {
    AppResponse appResponse = await registerRepository.verify(
      number,
      code,
    );

    if (appResponse.errorTxt.isEmpty) {
      emit(VerifyInSucces(verifyModel: appResponse.data as UserModel));
    } else {
      emit(VerifyInError(errorTxt: appResponse.errorTxt));
    }
  }
}
