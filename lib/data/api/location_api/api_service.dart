import 'package:dio/dio.dart';
import 'package:lady_taxi/data/api/location_api/api_clint.dart';
import 'package:lady_taxi/data/geocoding/geocoding.dart';
import 'package:lady_taxi/data/models/app_model.dart';

class ApiService extends ApiClient {
  Future<AppResponse> getLocationName(
      {required String geoCodeText, required String kind}) async {
    AppResponse appResponse = AppResponse(errorTxt: '');
    try {
      late Response response;
      Map<String, String> queryParams = {
        'apikey': "83de0b85-9f4e-401b-8570-e70b5be75ae5",
        'geocode': geoCodeText,
        'lang': 'uz_UZ',
        'format': 'json',
        'kind': kind,
        'rspn': '1',
        'results': '1',
      };
      response = await dio.get(
        dio.options.baseUrl,
        queryParameters: queryParams,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        Geocoding geocoding = Geocoding.fromJson(response.data);
        if (geocoding.response.geoObjectCollection.featureMember.isNotEmpty) {
          appResponse.data = geocoding
              .response
              .geoObjectCollection
              .featureMember[0]
              .geoObject
              .metaDataProperty
              .geocoderMetaData
              .text;
        } else {
          appResponse.data = 'Aniqlanmagan hudud';
        }
      } else {
        throw Exception();
      }
    } catch (e) {
      appResponse.errorTxt = e.toString();
    }
    return appResponse;
  }
}
