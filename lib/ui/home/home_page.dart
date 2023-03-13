import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lady_taxi/cubit/user_cubit/user_cubit.dart';
import 'package:lady_taxi/cubit/user_cubit/user_state.dart';
import 'package:lady_taxi/data/local_data/local_database.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';
import 'package:lady_taxi/data/models/user_model.dart';
import 'package:lady_taxi/ui/home/widgets/bottom_sheet_direction.dart';
import 'package:lady_taxi/ui/home/widgets/bottom_sheet_widget.dart';
import 'package:lady_taxi/ui/home/widgets/drawer.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class HomePage extends StatefulWidget {
  String token;
  HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String location = "";
  UserModel user = UserModel(
      id: "",
      fullName: "aa",
      gender: "",
      phoneNumber: "",
      refreshToken: "",
      accessToken: "",
      isActive: false,
      createdAt: "",
      updatedAt: "",
      deletedAt: "");

  List<LocationModel> position = [];
  _getLocation() async {
    position = await LocalDatabase.getCachedUser();
  }

  List<Widget> bottomSheets = [];
  int currentBottomsheet = 0;

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: MyDrawer(user: user),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserStateInSucces) {
            user = state.user;
            bottomSheets = [
              BottomSheetCurrentLocation(
                onTap: () {
                  currentBottomsheet += 1;
                  Navigator.pop(context);
                  setState(() {
                    _showModalBottomSheet(context, location);
                  });
                },
                location: position.last.locationName,
              ),
              BottomSheetDirection(
                name: user.fullName,
                onTap: () => setState(() {
                  currentBottomsheet++;
                }),
              ),
            ];
            return SafeArea(
              child: Stack(
                children: [
                  GoogleMap(
                    compassEnabled: false,
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
                        position.last.lattitude,
                        position.last.longtitude,
                      ),
                      zoom: 15,
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 32,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _key.currentState!.openDrawer();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8).r,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          width: 32.w,
                          height: 32.h,
                          child: SvgPicture.asset(
                            "assets/svg/drawer.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ],
              ),
            );
          }
          if (state is UserStateInLoad) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserStateInError) {
            return Center(
              child: Text(
                state.errorTxt,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            );
          }
          return const SizedBox();
        },
        buildWhen: (previous, current) {
          return position.isNotEmpty;
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          _showModalBottomSheet(
            context,
            position.last.locationName,
          );
        },
        child: SvgPicture.asset(
          "assets/svg/direction.svg",
          // ignore: deprecated_member_use
          color: MyColors.C_FE2E81,
        ),
      ),
    );
  }

  void _showModalBottomSheet(
    BuildContext context,
    String location,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) {
        return bottomSheets[currentBottomsheet];
      },
    );
  }
}
