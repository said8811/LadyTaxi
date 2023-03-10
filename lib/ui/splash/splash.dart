import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lady_taxi/cubit/location_cubit/location_cubit.dart';
import 'package:lady_taxi/cubit/location_cubit/location_state.dart';
import 'package:lady_taxi/cubit/user_cubit/user_cubit.dart';
import 'package:lady_taxi/data/api/location_api/api_service.dart';
import 'package:lady_taxi/data/local_data/local_database.dart';
import 'package:lady_taxi/data/models/lat_long_model.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';
import 'package:lady_taxi/data/models/user_model.dart';
import 'package:lady_taxi/data/repository/geo_coding.dart';
import 'package:lady_taxi/data/repository/location_repository.dart';
import 'package:lady_taxi/data/repository/user_repository.dart';
import 'package:lady_taxi/ui/home/home_page.dart';
import 'package:lady_taxi/ui/onBording/on_Bording.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _nextPage() async {
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      if (token.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnBordingPage(),
          ),
        );
      } else {
        context.read<UserCubit>().register(token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              token: token,
            ),
          ),
        );
      }
    });
  }

  // String id = "";
  String token = "";
  _getId() async {
    //  id = await StorageRepository.getId();
    token = await StorageRepository.gettoken();
    // print("ID:$id");
  }

  @override
  void initState() {
    _getId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(
          locationRepository: LocationRepository(),
          geocodingRepo: GeocodingRepo(apiService: ApiService()))
        ..getLocation(),
      child: BlocConsumer<LocationCubit, LocationState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                  child: Image.asset(
                "assets/images/splash_image.jpg",
                width: 125.w,
              )),
            ),
          );
        },
        listener: (context, state) async {
          if (state is LoadLocationINSucces) {
            await LocalDatabase.insertUser(
                userModel: LocationModel(
                    locationName: state.locationName,
                    lattitude: state.position.lattitude,
                    longtitude: state.position.longitude));
            _nextPage();
          }
        },
      ),
    );
  }
}
