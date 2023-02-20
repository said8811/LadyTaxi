import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class MyIndicator extends StatefulWidget {
  int currentIndex;
  MyIndicator({super.key, required this.currentIndex});

  @override
  State<MyIndicator> createState() => _MyIndicatorState();
}

class _MyIndicatorState extends State<MyIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, bottom: 16).r,
      height: 9.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: widget.currentIndex == index ? 16.w : 8.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.currentIndex == index
                  ? MyColors.C_FE2E81
                  : MyColors.C_FFB7D4,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 4.w);
        },
      ),
    );
  }
}
