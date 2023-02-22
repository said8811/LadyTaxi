import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_taxi/ui/registery/enter_phone_number.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class ProfileCreatePage extends StatefulWidget {
  const ProfileCreatePage({super.key});

  @override
  State<ProfileCreatePage> createState() => _ProfileCreatePageState();
}

class _ProfileCreatePageState extends State<ProfileCreatePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Profil yaratish",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          decoration: const BoxDecoration(color: Colors.white),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 32.h),
              SvgPicture.asset(
                "assets/svg/edit_icon.json",
                width: 102.w,
              ),
              SizedBox(height: 33.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Iltimos ism sharifingizni kiriting";
                        }
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "F.I.Sh",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none)),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Iltimos tug'ilgan sanangizni kiriting";
                        }
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Tug'ilgan sana",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnterNumberPage(),
                        ));
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24).r,
                  height: 47.h,
                  decoration: BoxDecoration(
                      color: MyColors.C_FE2E81,
                      borderRadius: BorderRadius.circular(30).r),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
