import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lady_taxi/data/models/drawer_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 4,
      itemBuilder: (context, index) {
        return ListTile(
          leading: DrawerModel.drawerModel[index].icon,
          title: Text(
            DrawerModel.drawerModel[index].title,
            style: TextStyle(color: DrawerModel.drawerModel[index].color),
          ),
        );
      },
    );
  }
}
