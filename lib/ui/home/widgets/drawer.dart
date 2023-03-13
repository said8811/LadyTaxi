import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class MyDrawer extends StatelessWidget {
  UserModel user;
  MyDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            height: 275.h,
            child: DrawerHeader(
              duration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              padding: const EdgeInsets.all(0),
              margin: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.C_FE2E81,
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/drawer_background.svg",
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 25.w,
                      bottom: 24.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/edit_icon.svg",
                            width: 88.w,
                          ),
                          SizedBox(height: 18.h),
                          Text(
                            user.fullName,
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "+${user.phoneNumber}",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  InkWell(
                    onTap: () {
                      // NavigatorPush(context, index, user);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        "assets/svg/person.svg",
                      ),
                      title: const Text(
                        "Profil",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // NavigatorPush(context, index, user);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        "assets/svg/history.svg",
                      ),
                      title: const Text(
                        "Safarlar tarixi",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // NavigatorPush(context, index, user);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        "assets/svg/settings.svg",
                      ),
                      title: const Text(
                        "Sozlamalar",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // NavigatorPush(context, index, user);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        "assets/svg/exit.svg",
                      ),
                      title: Text(
                        "Chiqish",
                        style: TextStyle(
                          color: MyColors.C_FD0166,
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
