import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class ProfileSettingsPage extends StatefulWidget {
  UserModel user;
  ProfileSettingsPage({super.key, required this.user});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Profil sozlamalari",
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
                      initialValue: widget.user.fullName,
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12).r,
                            child: SvgPicture.asset(
                              "assets/svg/edit_name.svg",
                            ),
                          ),
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
                          return "Iltimos raqamingizni kiriting";
                        }
                      },
                      initialValue: widget.user.phoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Telefon raqami",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none)),
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1955),
                            lastDate: DateTime(2018));
                      },
                      child: Container(
                        height: 60.h,
                        padding: const EdgeInsets.all(10).r,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Row(
                          children: [
                            Text(widget.user.createdAt),
                            const Spacer(),
                            SvgPicture.asset("assets/svg/calendar.svg")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24).r,
                        height: 47.h,
                        decoration: BoxDecoration(
                            color: MyColors.C_FE2E81,
                            borderRadius: BorderRadius.circular(30).r),
                        child: Center(
                          child: Text(
                            "Yangilash",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
