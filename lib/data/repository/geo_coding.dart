import 'package:lady_taxi/data/api/location_api/api_service.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/models/lat_long_model.dart';

class GeocodingRepo {
  GeocodingRepo({required this.apiService});

  final ApiService apiService;

  Future<AppResponse> getAddress(LatLong latLong, String kind) =>
      apiService.getLocationName(
          geoCodeText: "${latLong.longitude},${latLong.lattitude}", kind: kind);
}
