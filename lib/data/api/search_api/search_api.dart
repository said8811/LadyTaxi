import 'package:dio/dio.dart';
import 'package:lady_taxi/data/api/register_api/api_client.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/models/search_model/search_model.dart';
import 'package:lady_taxi/data/repository/user_repository.dart';

class SearchApiService extends RegisterApiClient {
  Future<AppResponse> search(String search) async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    String token = await StorageRepository.gettoken();
    try {
      Response response = await dio.get("${dio.options.baseUrl}/$search",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": token,
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.statusCode);
        print(response.data);
        myRespone.data = SearchModel.fromJson(response.data);
      }
    } catch (e) {
      print("ERRROOR: $e");
      myRespone.errorTxt = e.toString();
    }
    return myRespone;
  }
}
