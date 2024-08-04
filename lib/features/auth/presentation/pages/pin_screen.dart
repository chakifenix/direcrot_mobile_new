import 'dart:io';

import 'package:direcrot_mobile_new/core/common/widgets/dots.dart';
import 'package:direcrot_mobile_new/core/common/widgets/keyboard_number.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:direcrot_mobile_new/init_dependencies.dart';
import 'package:direcrot_mobile_new/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final sharedService = serviceLocator<SharedPreferencesService>();
  TextEditingController pinOneController = TextEditingController();

  TextEditingController pinTwoController = TextEditingController();

  TextEditingController pinThreeController = TextEditingController();

  TextEditingController pinFourController = TextEditingController();

  var outlineinputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.transparent));

  List<String> currentPin = ["", "", "", ""];

  int pinIndex = 0;

  bool pinPressed1 = false;
  bool pinPressed2 = false;
  bool pinPressed3 = false;
  bool pinPressed4 = false;

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(LoadUserInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 64.h),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.isSuccess) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 45.r,
                      backgroundColor: Colors.transparent,
                      child: (state.imagePath != null)
                          ? ClipOval(
                              child: Image.file(
                                File(state.imagePath!),
                                width: 58.w,
                                height: 58.h,
                                fit: BoxFit.cover,
                              ),
                            )
                          : (state.genderId == '2')
                              ? Image.asset(
                                  'images/directorLogo.png',
                                  width: 58.w,
                                  height: 58.h,
                                )
                              : Image.asset(
                                  'images/profile.png',
                                  width: 58.w,
                                  height: 58.h,
                                ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      state.fullName ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.41,
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(
                      'Code',
                      style: TextStyle(
                        color: const Color(0xFF9FA0A1),
                        fontSize: 17.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                        letterSpacing: -0.41,
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    buildPinRow(),
                    SizedBox(
                      height: 50.h,
                    ),
                    buildNumberPad(context),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  buildPinRow() {
    return SizedBox(
      width: 167.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Dots(
            pinPressed: pinPressed1,
          ),
          Dots(
            pinPressed: pinPressed2,
          ),
          Dots(
            pinPressed: pinPressed3,
          ),
          Dots(
            pinPressed: pinPressed4,
          ),
        ],
      ),
    );
  }

  pinIndexSetup(String text, BuildContext context) async {
    var pin = sharedService.pinCode;

    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, true);
    currentPin[pinIndex - 1] = text;
    String strPin = '';
    for (var e in currentPin) {
      strPin += e;
    }
    if (pinIndex == 4) {
      if (strPin == pin) {
        Navigator.pop(context);
      } else {
        pinIndex = 0;
        setState(() {
          pinPressed1 = false;
          pinPressed2 = false;
          pinPressed3 = false;
          pinPressed4 = false;
        });
      }
    }
  }

  setPin(int n, bool pressed) {
    switch (n) {
      case 1:
        setState(() {
          pinPressed1 = pressed;
        });
        break;
      case 2:
        setState(() {
          pinPressed2 = pressed;
        });
        break;
      case 3:
        setState(() {
          pinPressed3 = pressed;
        });
        break;
      case 4:
        setState(() {
          pinPressed4 = pressed;
        });
        break;
    }
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, false);
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, false);
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  buildNumberPad(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardNumber(
                  n: 1,
                  onPressed: () {
                    pinIndexSetup('1', context);
                  }),
              KeyboardNumber(
                  n: 2,
                  onPressed: () {
                    pinIndexSetup('2', context);
                  }),
              KeyboardNumber(
                  n: 3,
                  onPressed: () {
                    pinIndexSetup('3', context);
                  }),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardNumber(
                  n: 4,
                  onPressed: () {
                    pinIndexSetup('4', context);
                  }),
              KeyboardNumber(
                  n: 5,
                  onPressed: () {
                    pinIndexSetup('5', context);
                  }),
              KeyboardNumber(
                  n: 6,
                  onPressed: () {
                    pinIndexSetup('6', context);
                  }),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardNumber(
                  n: 7,
                  onPressed: () {
                    pinIndexSetup('7', context);
                  }),
              KeyboardNumber(
                  n: 8,
                  onPressed: () {
                    pinIndexSetup('8', context);
                  }),
              KeyboardNumber(
                  n: 9,
                  onPressed: () {
                    pinIndexSetup('9', context);
                  }),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 60.w,
                child: const MaterialButton(
                  onPressed: null,
                  child: SizedBox(),
                ),
              ),
              KeyboardNumber(
                  n: 0,
                  onPressed: () {
                    pinIndexSetup('0', context);
                  }),
              SizedBox(
                width: 60.w,
                child: MaterialButton(
                  height: 60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)),
                  onPressed: () {
                    clearPin();
                  },
                  child: Image.asset('images/delete.png'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
