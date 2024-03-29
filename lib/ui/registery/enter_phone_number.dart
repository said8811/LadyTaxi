import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lady_taxi/cubit/login_cubit/login_cubit.dart';
import 'package:lady_taxi/cubit/login_cubit/login_state.dart';
import 'package:lady_taxi/data/repository/user_repository.dart';
import 'package:lady_taxi/ui/registery/enter_pincode.dart';
import 'package:lady_taxi/utils/text_style.dart';
import 'package:lady_taxi/widgets/container_widget.dart';

class EnterNumberPage extends StatefulWidget {
  const EnterNumberPage({super.key});

  @override
  State<EnterNumberPage> createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  bool isNumber = false;
  String number = '';
  @override
  void initState() {
    StorageRepository.saveNavigate("/enterPhoneNumer");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 36.0).r,
          child: const Text(
            "Ro'yhatdan o'tish",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SafeArea(
          child: BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24).r,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 36.h),
                Text(
                  "Ro'yxatdan o'tish uchun\ntelefon raqamingizni kiriting",
                  style: fontPoppinsW400(appcolor: Colors.black)
                      .copyWith(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60.h),
                TextFormField(
                  onChanged: (value) {
                    if (value.length == 13) {
                      isNumber = true;
                      number = value;
                      setState(() {});
                    }
                  },
                  initialValue: "+998",
                  keyboardType: TextInputType.phone,
                  style: fontPoppinsW400(appcolor: Colors.black)
                      .copyWith(fontSize: 18.sp),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Telefon raqam",
                      labelText: "Telefon raqam"),
                ),
                const Spacer(),
                MyContainer(
                  text: "Container",
                  isDone: isNumber,
                  onTap: () {
                    if (isNumber) {
                      context
                          .read<RegisterCubit>()
                          .login(number.replaceAll("+", ""));
                    }
                  },
                )
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is RegisterInSucces) {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnterPinCodePage(
                    number: number,
                  ),
                ));
          }
          if (state is RegisterInLoad) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          if (state is RegisterInError) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: Text(state.errorTxt)),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"))
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
