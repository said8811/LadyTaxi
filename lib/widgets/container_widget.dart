import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class MyContainer extends StatelessWidget {
  final bool isDone;
  final VoidCallback onTap;
  final String text;
  const MyContainer(
      {super.key,
      required this.isDone,
      required this.onTap,
      required this.text});

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
            text,
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
