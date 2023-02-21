import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCreatePage extends StatelessWidget {
  const ProfileCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Profil yaratish",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 32.h),
            SvgPicture.asset(
              "assets/svg/edit_icon.json",
              width: 102.w,
            ),
          ],
        ),
      ),
    );
  }
}
