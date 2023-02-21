import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lady_taxi/ui/registery/enter_pincode.dart';
import 'package:lady_taxi/utils/my_utils.dart';
import 'package:toast/toast.dart';

class EnterNumberPage extends StatefulWidget {
  const EnterNumberPage({super.key});

  @override
  State<EnterNumberPage> createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  bool IsNumber = false;
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 36.0).r,
          child: const Text(
            "Ro'yhatdan o'tish",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            SizedBox(height: 36.h),
            Text(
              "Ro'yxatdan o'tish uchun\ntelefon raqamingizni kiriting",
              style: GoogleFonts.poppins(
                  fontSize: 16.sp, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60.h),
            TextFormField(
              onChanged: (value) {
                if (value.length == 13) {
                  IsNumber = true;
                  number = value;
                  setState(() {});
                }
              },
              initialValue: "+998",
              keyboardType: TextInputType.phone,
              style: GoogleFonts.inter(fontSize: 18.sp),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Telefon raqam",
                  labelText: "Telefon raqam"),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (IsNumber) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnterPinCodePage(
                          number: number,
                        ),
                      ));
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 24).r,
                height: 47.h,
                decoration: BoxDecoration(
                    color: IsNumber
                        ? MyColors.C_FE2E81
                        : MyColors.C_FD0166.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30).r),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: IsNumber
                            ? Colors.white
                            : MyColors.C_460000.withOpacity(0.7)),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
