import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/verify_cubit/verify_cubit.dart';
import 'package:lady_taxi/cubit/verify_cubit/verify_state.dart';
import 'package:lady_taxi/ui/registery/profile_create_page.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class EnterPinCodePage extends StatefulWidget {
  String number;
  EnterPinCodePage({super.key, required this.number});

  @override
  State<EnterPinCodePage> createState() => _EnterPinCodePageState();
}

class _EnterPinCodePageState extends State<EnterPinCodePage> {
  TextEditingController controller = TextEditingController(text: "");
  int left = 120;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (left != 0) {
        setState(() {
          left--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Ro'yhatdan o'tish",
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 66.h,
      ),
      body: BlocConsumer<VerifyCubit, VerifyState>(
        builder: (context, state) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: GoogleFonts.roboto(
                      fontSize: 16.0.sp,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text: "Tasdiqlash kodi ",
                      ),
                      TextSpan(
                          text: widget.number,
                          style: TextStyle(color: MyColors.C_FD0166)),
                      const TextSpan(text: "\nraqamiga yuborildi")
                    ]),
              ),
              SizedBox(height: 8.h),
              Text(
                "Qabul qilish vaqti:",
                style: GoogleFonts.roboto(fontSize: 16.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                MyTimer.getMyTimer(left),
                style: TextStyle(
                    fontSize: 16.sp,
                    color: MyColors.C_FD0166,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80.h),
              Container(
                child: PinCodeTextField(
                  controller: controller,
                  autofocus: true,
                  highlight: true,
                  pinBoxBorderWidth: 1.w,
                  defaultBorderColor: const Color(0xFFEFEFEF),
                  highlightColor: MyColors.C_FD0166.withOpacity(0.2),
                  highlightPinBoxColor: MyColors.C_FD0166.withOpacity(0.2),
                  pinBoxColor: const Color(0xFFEFEFEF).withOpacity(0.2),
                  hasTextBorderColor: MyColors.C_FD0166.withOpacity(0.3),
                  maxLength: 4,
                  onTextChanged: (text) {
                    text = controller.text;
                    print(controller.text);
                    setState(() {});
                  },
                  onDone: (text) {},
                  pinBoxWidth: 64.w,
                  pinBoxHeight: 52.h,
                  pinBoxRadius: 12.r,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinTextStyle: GoogleFonts.roboto(fontSize: 22.0),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Kod qayta yuborilsin",
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  if (controller.text.length == 4) {
                    context.read<VerifyCubit>().verify(
                        widget.number.replaceAll("+", ""), controller.text);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24).r,
                  height: 47.h,
                  decoration: BoxDecoration(
                      color: controller.text.length == 4
                          ? MyColors.C_FE2E81
                          : MyColors.C_FD0166.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30).r),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: controller.text.length == 4
                              ? Colors.white
                              : MyColors.C_460000.withOpacity(0.7)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        listener: (context, state) {
          if (state is VerifyInSucces) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileCreatePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
