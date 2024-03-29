import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/location_cubit/location_cubit.dart';
import 'package:lady_taxi/cubit/login_cubit/login_cubit.dart';
import 'package:lady_taxi/cubit/register_cubit/register_user_cubit.dart';
import 'package:lady_taxi/cubit/search_cubit/search_cubit.dart';
import 'package:lady_taxi/cubit/user_cubit/user_cubit.dart';
import 'package:lady_taxi/cubit/verify_cubit/verify_cubit.dart';
import 'package:lady_taxi/data/api/location_api/api_service.dart';
import 'package:lady_taxi/data/api/register_api/api_service.dart';
import 'package:lady_taxi/data/api/search_api/search_api.dart';
import 'package:lady_taxi/data/api/user_api/user_api_service.dart';
import 'package:lady_taxi/data/repository/geo_coding.dart';
import 'package:lady_taxi/data/repository/location_repository.dart';
import 'package:lady_taxi/data/repository/register_repos/login_repository.dart';
import 'package:lady_taxi/data/repository/search_repository/search_repository.dart';
import 'package:lady_taxi/data/repository/user_repository.dart';
import 'package:lady_taxi/data/repository/user_repository/user_repository.dart';
import 'package:lady_taxi/ui/app_router.dart';
import 'package:lady_taxi/ui/splash/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

void main() async {
  StorageRepository.getInstance();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => LocationCubit(
        geocodingRepo: GeocodingRepo(apiService: ApiService()),
        locationRepository: LocationRepository(),
      )..getLocation(),
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
    ),
    BlocProvider(
      create: (context) =>
          UserCubit(repository: UserRepository(apiService: UserApiService())),
    ),
    BlocProvider(
      create: (context) => SearchCubit(
          searchRepository: SearchRepository(apiService: SearchApiService())),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        initialRoute: RouteName.splash,
        onGenerateRoute: AppRoutes.generateRoute,
        home: const SplashPage(),
      ),
    );
  }
}
