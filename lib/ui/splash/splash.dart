import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lady_taxi/cubit/location_cubit/location_cubit.dart';
import 'package:lady_taxi/cubit/location_cubit/location_state.dart';
import 'package:lady_taxi/data/api/location_api/api_service.dart';
import 'package:lady_taxi/data/local_data/local_database.dart';
import 'package:lady_taxi/data/models/user_model.dart';
import 'package:lady_taxi/data/repository/geo_coding.dart';
import 'package:lady_taxi/data/repository/location_repository.dart';
import 'package:lady_taxi/ui/home/home_page.dart';
import 'package:lady_taxi/ui/onBording/on_Bording.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _nextPage() {
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      List<UserModel> user = await LocalDatabase.getCachedUser();
      if (user.isEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBordingPage(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      user: user.last,
                    )));
      }
    });
  }

  @override
  void initState() {
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
        listener: (context, state) {
          if (state is LoadLocationINSucces) {
            _nextPage();
          }
        },
      ),
    );
  }
}
