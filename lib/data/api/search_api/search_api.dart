import 'package:dio/dio.dart';
import 'package:lady_taxi/data/api/register_api/api_client.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/models/search_model/search_model.dart';

class SearchApiService extends RegisterApiClient {
  Future<AppResponse> search(String search) async {
    AppResponse myRespone = AppResponse(errorTxt: "");
    try {
      Response response = await dio.get(
        "${dio.options.baseUrl}/$search",
      );
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
