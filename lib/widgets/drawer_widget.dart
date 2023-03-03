import 'package:flutter/material.dart';
import 'package:lady_taxi/data/models/drawer_model.dart';
import 'package:lady_taxi/data/models/register_models/verify_model.dart';
import 'package:lady_taxi/widgets/navigator_push_widget.dart';

class DrawerWidget extends StatelessWidget {
  BuildContext context;
  UserModel user;
  DrawerWidget({super.key, required this.context, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            NavigatorPush(context, index, user);
          },
          child: ListTile(
            leading: DrawerModel.drawerModel[index].icon,
            title: Text(
              DrawerModel.drawerModel[index].title,
              style: TextStyle(color: DrawerModel.drawerModel[index].color),
            ),
          ),
        );
      },
    );
  }
}
