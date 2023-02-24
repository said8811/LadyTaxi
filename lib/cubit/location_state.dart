import 'package:lady_taxi/data/models/lat_long_model.dart';

abstract class LocationState {}

class LoadLocationINLoading extends LocationState {}

class LoadLocationINError extends LocationState {
  String errorTxt;
  LoadLocationINError({required this.errorTxt});
}

class LoadLocationINSucces extends LocationState {
  LatLong position;
  LoadLocationINSucces({required this.position});
}
