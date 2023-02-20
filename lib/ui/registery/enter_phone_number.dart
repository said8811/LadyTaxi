import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterNumberPage extends StatefulWidget {
  const EnterNumberPage({super.key});

  @override
  State<EnterNumberPage> createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: 36.w,
            ),
            const Text(
              "Ro'yhatdan o'tish",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            SizedBox(height: 36.h),
            Text(
              "Ro'yxatdan o'tish uchun\ntelefon raqamingizni kiriting",
              style: GoogleFonts.poppins(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60.h),
          ],
        ),
      )),
    );
  }
}
