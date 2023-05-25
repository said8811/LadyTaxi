import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class BottomSheetCurrentLocation extends StatelessWidget {
  final String location;
  final VoidCallback onTap;
  const BottomSheetCurrentLocation(
      {super.key, required this.location, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.25,
      maxChildSize: 0.35,
      minChildSize: 0.20,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Container(
          padding: const EdgeInsets.all(24).r,
          height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/svg/mark.svg"),
              SizedBox(height: 8.h),
              Text(
                location,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.sp,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 47.h,
                  decoration: BoxDecoration(
                      color: MyColors.C_FE2E81,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Jo'nash manzilim",
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
