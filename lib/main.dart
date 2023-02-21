import 'package:flutter/material.dart';
import 'package:lady_taxi/ui/splash/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lady_taxi/utils/my_utils.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(const MyApp());
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
