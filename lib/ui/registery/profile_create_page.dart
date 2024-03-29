import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_taxi/cubit/register_cubit/register_user_cubit.dart';
import 'package:lady_taxi/cubit/register_cubit/register_user_state.dart';
import 'package:lady_taxi/cubit/user_cubit/user_cubit.dart';
import 'package:lady_taxi/data/repository/user_repository.dart';
import 'package:lady_taxi/ui/app_router.dart';
import 'package:lady_taxi/utils/my_utils.dart';

class ProfileCreatePage extends StatefulWidget {
  final String token;
  const ProfileCreatePage({super.key, required this.token});

  @override
  State<ProfileCreatePage> createState() => _ProfileCreatePageState();
}

class _ProfileCreatePageState extends State<ProfileCreatePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String dropdownvalue = 'ayol';

  var items = [
    'ayol',
    'erkak',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Profil yaratish",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocConsumer<UserRegisterCubit, UserRegisterState>(
        builder: (context, state) => Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          decoration: const BoxDecoration(color: Colors.white),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 32.h),
              SvgPicture.asset(
                "assets/svg/edit_icon.svg",
                width: 102.w,
              ),
              SizedBox(height: 33.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Iltimos ism sharifingizni kiriting";
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "F.I.Sh",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none)),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 47.h,
                      width: double.infinity,
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(24),
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    context.read<UserRegisterCubit>().register(
                        nameController.text.trim(),
                        dropdownvalue,
                        widget.token);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24).r,
                  height: 47.h,
                  decoration: BoxDecoration(
                      color: MyColors.C_FE2E81,
                      borderRadius: BorderRadius.circular(30).r),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        listener: (context, state) {
          if (state is UserRegisterInSucces) {
            context.read<UserCubit>().register(state.user.accessToken);
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, RouteName.home,
                arguments: state.user.accessToken);
            StorageRepository.savetoken(state.user.accessToken);
          }
          if (state is UserRegisterInLoad) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          if (state is UserRegisterInError) {
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
      ),
    );
  }
}
