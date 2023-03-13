import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class MyContainer extends StatelessWidget {
  bool isDone;
  VoidCallback onTap;
  MyContainer({super.key, required this.isDone, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24).r,
        height: 47.h,
        decoration: BoxDecoration(
            color:
                isDone ? MyColors.C_FE2E81 : MyColors.C_FD0166.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30).r),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
                fontSize: 14.sp,
                color:
                    isDone ? Colors.white : MyColors.C_460000.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}
