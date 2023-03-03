import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/location_cubit/location_cubit.dart';
import 'package:lady_taxi/cubit/login_cubit/login_cubit.dart';
import 'package:lady_taxi/cubit/register_cubit/register_user_cubit.dart';
import 'package:lady_taxi/cubit/verify_cubit/verify_cubit.dart';
import 'package:lady_taxi/data/api/location_api/api_service.dart';
import 'package:lady_taxi/data/api/register_api/api_service.dart';
import 'package:lady_taxi/data/repository/geo_coding.dart';
import 'package:lady_taxi/data/repository/location_repository.dart';
import 'package:lady_taxi/data/repository/register_repos/login_repository.dart';
import 'package:lady_taxi/data/repository/user_repository.dart';
import 'package:lady_taxi/ui/splash/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

void main() async {
  StorageRepository.getInstance();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => LocationCubit(
          locationRepository: LocationRepository(),
          geocodingRepo: GeocodingRepo(apiService: ApiService()))
        ..getLocation(),
    ),
    BlocProvider(
      create: (context) => RegisterCubit(
          repository: RegisterRepository(apiService: RegisterApiService())),
    ),
    BlocProvider(
      create: (context) => VerifyCubit(
          registerRepository:
              RegisterRepository(apiService: RegisterApiService())),
    ),
    BlocProvider(
      create: (context) => UserRegisterCubit(
          repository: RegisterRepository(apiService: RegisterApiService())),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 802),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
