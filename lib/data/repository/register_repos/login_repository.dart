import 'package:lady_taxi/data/api/register_api/api_service.dart';
import 'package:lady_taxi/data/models/app_model.dart';

class RegisterRepository {
  RegisterRepository({required this.apiService});
  RegisterApiService apiService;

  Future<AppResponse> login(String number) => apiService.loginRequest(number);

  Future<AppResponse> verify(
    String number,
    String code,
  ) =>
      apiService.verifyUser(
        number,
        code,
      );

  Future<AppResponse> registerUser(
          String fullName, String gender, String token) =>
      apiService.registery(fullName, gender, token);
}
