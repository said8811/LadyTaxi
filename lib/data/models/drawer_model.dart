import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class DrawerModel {
  String title;
  SvgPicture icon;
  Color color;

  DrawerModel({required this.title, required this.color, required this.icon});

  static List<DrawerModel> drawerModel = [
    DrawerModel(
      title: "Profil",
      color: Colors.black,
      icon: SvgPicture.asset(
        "assets/svg/person.json",
      ),
    ),
    DrawerModel(
      title: "Safarlar tarixi",
      color: Colors.black,
      icon: SvgPicture.asset(
        "assets/svg/history.json",
      ),
    ),
    DrawerModel(
      title: "Sozlamalar",
      color: Colors.black,
      icon: SvgPicture.asset(
        "assets/svg/settings.json",
      ),
    ),
    DrawerModel(
      title: "Chiqish",
      color: MyColors.C_FD0166,
      icon: SvgPicture.asset(
        "assets/svg/exit.json",
      ),
    ),
  ];
}
