import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/location_state.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/repository/geo_coding.dart';
import 'package:lady_taxi/data/repository/location_repository.dart';

import '../data/models/lat_long_model.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationRepository, required this.geocodingRepo})
      : super(LoadLocationINLoading());
  LocationRepository locationRepository;
  GeocodingRepo geocodingRepo;
  getLocation() async {
    LatLong? latlong = await locationRepository.fetchCurrentLocation();
    if (latlong == null) {
      emit(LoadLocationINError(errorTxt: "errorTxt"));
    } else {
      AppResponse response = await geocodingRepo.getAddress(
          LatLong(lattitude: latlong.lattitude, longitude: latlong.longitude),
          "house");
      if (response.errorTxt.isEmpty) {
        emit(LoadLocationINSucces(
            position: latlong, locationName: response.data as String));
      } else {
        emit(LoadLocationINSucces(
            position: latlong, locationName: response.errorTxt));
      }
    }
  }
}
