import 'package:flutter/material.dart';
import 'package:lady_taxi/data/models/lat_long_model.dart';
import 'package:lady_taxi/data/models/on_Bording_model.dart';
import 'package:lady_taxi/ui/registery/enter_phone_number.dart';
import 'package:lady_taxi/utils/my_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_taxi/widgets/indicator.dart';
import 'package:lady_taxi/widgets/richtext.dart';

class OnBordingPage extends StatefulWidget {
  // LatLong latlong;
  // String location;
  OnBordingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBordingPage> createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBordingPage> {
  int currentIndex = 0;
  String txt = "Next";
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.sp, left: 300.sp),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnterNumberPage(),
                        ));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: MyColors.C_FD0166, fontSize: 16.sp),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    currentIndex = value;
                    if (value == 2) txt = "Start";
                    setState(() {});
                  },
                  itemCount: OnBordingModel.pages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 326.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    OnBordingModel.pages[index].bgImg),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                                OnBordingModel.pages[index].imgUrl),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        MYRichText(
                          index: currentIndex,
                        )
                      ],
                    );
                  },
                ),
              ),
              MyIndicator(
                currentIndex: currentIndex,
              ),
              InkWell(
                onTap: () {
                  if (txt == "Start") {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnterNumberPage(),
                        ));
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  }
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 24.sp, vertical: 24.sp),
                  height: 47.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyColors.C_FE2E81),
                  child: Center(
                    child: Text(
                      txt,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
