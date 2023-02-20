import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lady_taxi/data/models/on_Bording_model.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class MYRichText extends StatelessWidget {
  int index;
  MYRichText({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: index == 0
            ? [
                TextSpan(
                    text: OnBordingModel.pages[index].description.split(" ")[0],
                    style: TextStyle(color: MyColors.C_FE2E81)),
                TextSpan(
                  text: OnBordingModel.pages[index].description.substring(
                      9, OnBordingModel.pages[index].description.length),
                ),
              ]
            : index == 1
                ? [
                    TextSpan(
                      text: OnBordingModel.pages[index].description
                          .substring(0, 25),
                    ),
                    TextSpan(
                        text: OnBordingModel.pages[index].description
                            .substring(25, 36),
                        style: TextStyle(color: MyColors.C_FE2E81)),
                    TextSpan(
                      text:
                          " ${OnBordingModel.pages[index].description.split(" ")[3]}",
                    ),
                  ]
                : [
                    TextSpan(
                      text: OnBordingModel.pages[index].description
                          .substring(0, 25),
                    ),
                    TextSpan(
                        text: OnBordingModel.pages[index].description
                            .substring(25, 32),
                        style: TextStyle(color: MyColors.C_FE2E81)),
                    TextSpan(
                      text:
                          " ${OnBordingModel.pages[index].description.split(" ")[4]} ${OnBordingModel.pages[index].description.split(" ")[5]}",
                    ),
                  ],
      ),
    );
  }
}
