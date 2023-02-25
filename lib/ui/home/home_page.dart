import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lady_taxi/cubit/location_cubit.dart';
import 'package:lady_taxi/cubit/location_state.dart';
import 'package:lady_taxi/data/models/lat_long_model.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  String location = "";
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          maxChildSize: 0.98,
          minChildSize: 0.25,
          builder: (context, scrollController) => SingleChildScrollView(
            controller: scrollController,
            child: Container(
              height: 300.h,
              child: Center(
                child: Text(location),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LoadLocationINSucces) {
              location = state.locationName;
              return Stack(
                children: [
                  GoogleMap(
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
                  ),
                  Positioned(
                      left: 20,
                      top: 32,
                      child: Container(
                        padding: const EdgeInsets.all(8).r,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        width: 32.w,
                        height: 32.h,
                        child: SvgPicture.asset(
                          "assets/svg/drawer.json",
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          _showModalBottomSheet(
            context,
          );
        },
        child: SvgPicture.asset(
          "assets/svg/direction.json",
          // ignore: deprecated_member_use
          color: MyColors.C_FE2E81,
        ),
      ),
    );
  }
}
