import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lady_taxi/utils/text_style.dart';

import '../../../../utils/my_utils.dart';

class BottomSheetSearch extends StatelessWidget {
  const BottomSheetSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.58,
      maxChildSize: 0.80,
      minChildSize: 0.30,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Container(
          padding: const EdgeInsets.all(24).r,
          height: 500.h,
          child: Column(
            children: [
              Container(
                width: 20.w,
                height: 1.h,
                decoration: BoxDecoration(color: MyColors.C_FE2E81),
              ),
              Text(
                "Manzilni kiriting",
                style: fontPoppinsW500(appcolor: Colors.black)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/location_elipse.svg"),
                  SizedBox(width: 10.w),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20).r,
                    height: 48.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                        color: MyColors.C_FE2E81.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Row(
                      children: [
                        Text(
                          "Turgan joyim",
                          style: fontRobotoW400(appcolor: MyColors.C_121212)
                              .copyWith(fontSize: 14.sp),
                        ),
                        const Spacer(),
                        SvgPicture.asset("assets/icons/radar.svg"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/mark.svg"),
                  SizedBox(width: 10.w),
                  Container(
                    padding: const EdgeInsets.only(left: 10).r,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(16.r)),
                    width: 282.w,
                    height: 48.h,
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: MyColors.C_121212.withOpacity(0.54),
                          border: InputBorder.none,
                          hintText: "Qayerga borasiz?",
                          hintStyle: fontRobotoW400(
                                  appcolor: MyColors.C_121212.withOpacity(0.54))
                              .copyWith(fontSize: 14.sp),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SvgPicture.asset(
                              "assets/icons/mark_2.svg",
                              height: 10.h,
                            ),
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(height: 60.h),
              BlocConsumer(
                builder: (context, state) => RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: GoogleFonts.roboto(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text: "Saqlangan ",
                        ),
                        TextSpan(
                            text: "manzilar ",
                            style: TextStyle(color: MyColors.C_FE2E81)),
                        const TextSpan(text: "mavjud emas")
                      ]),
                ),
                listener: (context, state) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
