import 'package:dio/dio.dart';
import 'package:lady_taxi/data/api/register_api/api_client.dart';
import 'package:lady_taxi/data/models/app_model.dart';

class RegisterApiService extends RegisterApiClient {
  Future<AppResponse> loginRequest(String number) async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    try {
      Response response =
          await dio.post("${dio.options.baseUrl}/user/login/$number");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.statusCode);
        myRespone.data = response.data;
      }
    } catch (e) {
      print(e);
      myRespone.errorTxt = e.toString();
    }
    return myRespone;
  }

  Future<AppResponse> verifyUser(String number, String code) async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    try {
      Response response =
          await dio.get("${dio.options.baseUrl}/user/verify/$number/$code");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.statusCode);
        myRespone.data = response.data;
      }
    } catch (e) {
      print("ERRROOR: $e");
      myRespone.errorTxt = e.toString();
    }
    return myRespone;
  }
}
