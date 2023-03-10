import 'package:dio/dio.dart';
import 'package:lady_taxi/data/api/user_api/user_api_client.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';

class UserApiService extends UserApiClient {
  Future<AppResponse> getUser(String token) async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/user",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": token,
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.statusCode);
        //print(response.data);
        myRespone.data = UserModel.fromJson(response.data);
      }
    } catch (e) {
      print("ERRROOR: $e");
      myRespone.errorTxt = e.toString();
    }
    return myRespone;
  }
}
