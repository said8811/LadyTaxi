import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lady_taxi/utils/text_style.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../../utils/my_utils.dart';

class MyPincode extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged onChanges;
  final ValueChanged onDone;

  const MyPincode(
      {super.key,
      required this.controller,
      required this.onChanges,
      required this.onDone});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      autofocus: true,
      highlight: true,
      pinBoxBorderWidth: 1.w,
      defaultBorderColor: const Color(0xFFEFEFEF),
      highlightColor: MyColors.C_FD0166.withOpacity(0.2),
      highlightPinBoxColor: MyColors.C_FD0166.withOpacity(0.2),
      pinBoxColor: const Color(0xFFEFEFEF).withOpacity(0.2),
      hasTextBorderColor: MyColors.C_FD0166.withOpacity(0.3),
      maxLength: 4,
      onTextChanged: onChanges,
      onDone: onDone,
      pinBoxWidth: 64.w,
      pinBoxHeight: 52.h,
      pinBoxRadius: 12.r,
      wrapAlignment: WrapAlignment.spaceAround,
      pinTextStyle:
          fontRobotoW400(appcolor: Colors.black).copyWith(fontSize: 22.0),
      keyboardType: TextInputType.number,
    );
  }
}
