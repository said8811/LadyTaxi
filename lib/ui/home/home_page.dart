import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lady_taxi/cubit/location_cubit.dart';
import 'package:lady_taxi/cubit/location_state.dart';
import 'package:lady_taxi/data/models/lat_long_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LoadLocationINSucces) {
              return Container(
                child: GoogleMap(
                  padding: const EdgeInsets.all(16),
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      state.position.lattitude,
                      state.position.longitude,
                    ),
                    zoom: 15,
                  ),

                  //polylines: ,
                ),
              );
            }
            if (state is LoadLocationINLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
