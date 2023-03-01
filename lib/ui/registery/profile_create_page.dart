import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_taxi/data/local_data/local_database.dart';
import 'package:lady_taxi/data/models/user_model.dart';
import 'package:lady_taxi/ui/home/home_page.dart';
import 'package:lady_taxi/ui/registery/enter_phone_number.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class ProfileCreatePage extends StatefulWidget {
  const ProfileCreatePage({super.key});

  @override
  State<ProfileCreatePage> createState() => _ProfileCreatePageState();
}

class _ProfileCreatePageState extends State<ProfileCreatePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late List<UserModel> users;
  getUser() async {
    users = await LocalDatabase.getCachedUser();
  }

  @override
  void initState() {
    super.initState();
  }

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
                "assets/svg/edit_icon.svg",
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
                      controller: nameController,
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
                      controller: dateController,
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
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    LocalDatabase.insertUser(
                        userModel: UserModel(
                            fish: nameController.text,
                            date: dateController.text,
                            number: "+998994660811",
                            imgUrl: ""));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            user: users.last,
                          ),
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
