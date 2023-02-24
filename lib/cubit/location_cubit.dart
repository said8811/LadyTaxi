import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/location_state.dart';
import 'package:lady_taxi/data/repository/location_repository.dart';

import '../data/models/lat_long_model.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationRepository})
      : super(LoadLocationINLoading());
  LocationRepository locationRepository;
  getLocation() async {
    LatLong? latlong = await locationRepository.fetchCurrentLocation();
    if (latlong == null) {
      emit(LoadLocationINError(errorTxt: "errorTxt"));
    } else {
      emit(LoadLocationINSucces(position: latlong));
    }
  }
}
