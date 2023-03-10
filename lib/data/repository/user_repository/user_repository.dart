import 'package:lady_taxi/data/api/user_api/user_api_service.dart';
import 'package:lady_taxi/data/models/app_model.dart';

class UserRepository {
  UserRepository({required this.apiService});
  UserApiService apiService;

  Future<AppResponse> getUser(String token) => apiService.getUser(token);
}
