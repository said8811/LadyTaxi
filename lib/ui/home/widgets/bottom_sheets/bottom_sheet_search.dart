import 'package:flutter/material.dart';
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
      initialChildSize: 0.38,
      maxChildSize: 0.50,
      minChildSize: 0.30,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Container(
          padding: const EdgeInsets.all(24).r,
          height: 290.h,
          child: Column(
            children: [
              Text(
                "Manzilni kiriting",
                style: fontPoppinsW500(appcolor: Colors.black)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20).r,
                  height: 48.h,
                  decoration: BoxDecoration(
                      color: MyColors.C_F0F0F0,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Row(
                    children: [
                      Text(
                        "Qayerga boramiz?",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: MyColors.C_121212.withOpacity(0.54)),
                      ),
                      const Spacer(),
                      SvgPicture.asset("assets/svg/line.svg"),
                      SizedBox(width: 10.w),
                      SvgPicture.asset("assets/svg/globe.svg"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              RichText(
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
            ],
          ),
        ),
      ),
    );
  }
}
