import 'package:flutter/material.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';
import 'package:lady_taxi/ui/drawer/profile_settings.dart';

Future NavigatorPush(BuildContext context, int index, UserModel user) {
  if (index == 0) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileSettingsPage(
                  user: user,
                )));
  } else if (index == 1) {
    return Future.value();
  }
  return Future.value();
}
