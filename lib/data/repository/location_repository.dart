import 'package:lady_taxi/data/models/lat_long_model.dart';
import 'package:location/location.dart';

class LocationRepository {
  LocationRepository();
  bool _serviceEnabled = false;
  Location location = Location();
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  Future<LatLong?> fetchCurrentLocation() async {
//1- qadam location qurilmada enable yoki disable ekanini tekshiradi
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

//2- qadam lakatsiyaga permission oladi

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    // lakatsiyani oladi
    LocationData locationData = await location.getLocation();
    return LatLong(
      lattitude: locationData.latitude!,
      longitude: locationData.longitude!,
    );
  }
}
