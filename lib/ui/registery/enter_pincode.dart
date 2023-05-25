import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/verify_cubit/verify_cubit.dart';
import 'package:lady_taxi/cubit/verify_cubit/verify_state.dart';
import 'package:lady_taxi/data/repository/user_repository.dart';
import 'package:lady_taxi/ui/app_router.dart';
import 'package:lady_taxi/ui/registery/profile_create_page.dart';
import 'package:lady_taxi/utils/text_style.dart';
import 'package:lady_taxi/ui/registery/widgets/pincode.dart';
import 'package:lady_taxi/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class EnterPinCodePage extends StatefulWidget {
  final String number;
  const EnterPinCodePage({super.key, required this.number});

  @override
  State<EnterPinCodePage> createState() => _EnterPinCodePageState();
}

class _EnterPinCodePageState extends State<EnterPinCodePage> {
  TextEditingController controller = TextEditingController(text: "");
  int left = 120;
  late Timer timers;
  @override
  void initState() {
    super.initState();
    timers = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (left != 0) {
        setState(() {
          left--;
        });
      }
    });
  }

  @override
  void dispose() {
    timers.cancel();
    super.dispose();
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
                    style: fontRobotoW400(
                      appcolor: Colors.black,
                    ).copyWith(
                      fontSize: 16.0.sp,
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
                  decoration: const BoxDecoration(),
                  child: MyPincode(
                    controller: controller,
                    onChanges: (text) {
                      text = controller.text;
                      setState(() {});
                    },
                    onDone: (value) => context.read<VerifyCubit>().verify(
                          widget.number.replaceAll("+", ""),
                          value,
                        ),
                  )),
              SizedBox(height: 16.h),
              Text(
                "Kod qayta yuborilsin",
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
              const Spacer(),
              MyContainer(
                text: "Container",
                onTap: () {
                  if (controller.text.length == 4) {
                    context.read<VerifyCubit>().verify(
                          widget.number.replaceAll("+", ""),
                          controller.text,
                        );
                  }
                },
                isDone: controller.text.length == 4,
              )
            ],
          ),
        ),
        listener: (context, state) async {
          if (state is VerifyInSucces) {
            Navigator.pop(context);
            if (state.verifyModel.id.isEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileCreatePage(
                    token: state.verifyModel.accessToken,
                  ),
                ),
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.home, (route) => false,
                  arguments: state.verifyModel.accessToken);
              StorageRepository.savetoken(state.verifyModel.accessToken);
            }
          }
          if (state is VerifyInLoading) {
            // ignore: use_build_context_synchronously
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          if (state is VerifyInError) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: Text(state.errorTxt)),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
