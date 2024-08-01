import 'package:direcrot_mobile_new/core/home_page/nav_screen.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/dots.dart';
import 'package:direcrot_mobile_new/core/common/widgets/keyboard_number.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';
import 'package:direcrot_mobile_new/init_dependencies.dart';
import 'package:direcrot_mobile_new/services/local_storage.dart';
import 'package:direcrot_mobile_new/services/shared_preferences_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetPinPage extends StatefulWidget {
  final User? user;
  static Route route({required User? user}) => MaterialPageRoute(
      builder: (context) => SetPinPage(
            user: user,
          ));
  const SetPinPage({super.key, required this.user});

  @override
  State<SetPinPage> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  final localStorage = LocalStorage();
  final sharedService = serviceLocator<SharedPreferencesService>();
  List<String> currentPin = ["", "", "", ""];

  int pinIndex = 0;
  int times = 0;

  bool pinPressed1 = false;
  bool pinPressed2 = false;
  bool pinPressed3 = false;
  bool pinPressed4 = false;

  bool pinPressed5 = false;
  bool pinPressed6 = false;
  bool pinPressed7 = false;
  bool pinPressed8 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 164.h),
        child: Column(
          children: [
            Text(
              'auth'.tr(),
              style: AppTheme.authLargeTextStyle.copyWith(height: 0),
            ),
            Text(
              'pincode'.tr(),
              style: AppTheme.authMediumTextStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 120.h,
            ),
            Column(
              children: [
                buildPinRow(),
                SizedBox(
                  height: 9.h,
                ),
                times == 1
                    ? buildPinRow1()
                    : SizedBox(
                        height: 35.h,
                      )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            buildNumberPad(context)
          ],
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

  buildPinRow1() {
    return SizedBox(
      width: 167.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Dots(
            pinPressed: pinPressed5,
          ),
          Dots(
            pinPressed: pinPressed6,
          ),
          Dots(
            pinPressed: pinPressed7,
          ),
          Dots(
            pinPressed: pinPressed8,
          ),
        ],
      ),
    );
  }

  buildNumberPad(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyboardNumber(
                  n: 1,
                  onPressed: () {
                    pinIndexSetup('1', context);
                  }),
              SizedBox(
                width: 12.w,
              ),
              KeyboardNumber(
                  n: 2,
                  onPressed: () {
                    pinIndexSetup('2', context);
                  }),
              SizedBox(
                width: 12.w,
              ),
              KeyboardNumber(
                  n: 3,
                  onPressed: () {
                    pinIndexSetup('3', context);
                  }),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyboardNumber(
                  n: 4,
                  onPressed: () {
                    pinIndexSetup('4', context);
                  }),
              SizedBox(
                width: 12.w,
              ),
              KeyboardNumber(
                  n: 5,
                  onPressed: () {
                    pinIndexSetup('5', context);
                  }),
              SizedBox(
                width: 12.w,
              ),
              KeyboardNumber(
                  n: 6,
                  onPressed: () {
                    pinIndexSetup('6', context);
                  }),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyboardNumber(
                  n: 7,
                  onPressed: () {
                    pinIndexSetup('7', context);
                  }),
              SizedBox(
                width: 12.w,
              ),
              KeyboardNumber(
                  n: 8,
                  onPressed: () {
                    pinIndexSetup('8', context);
                  }),
              SizedBox(
                width: 12.w,
              ),
              KeyboardNumber(
                  n: 9,
                  onPressed: () {
                    pinIndexSetup('9', context);
                  }),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 84.w,
                child: const MaterialButton(
                  onPressed: null,
                  child: SizedBox(),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              KeyboardNumber(
                  n: 0,
                  onPressed: () {
                    pinIndexSetup('0', context);
                  }),
              SizedBox(
                width: 12.w,
              ),
              Container(
                width: 84.w,
                height: 84.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFDDDDDD)),
                child: MaterialButton(
                  height: 60.h,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0.r)),
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

  pinIndexSetup(String text, BuildContext context) async {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    String strPin = '';
    String strPin2 = '';

    if (times == 0) {
      setPin(pinIndex, true);
      currentPin[pinIndex - 1] = text;

      for (var e in currentPin) {
        strPin += e;
      }
      if (pinIndex == 4) {
        times = 1;
        pinIndex = 0;
        sharedService.pinCode = strPin;
        // DirectorService.storegeSetPin(strPin);

        // SharedPreferences preferences = await SharedPreferences.getInstance();
        // await preferences.setString('setPin', strPin);
      }
    } else if (times == 1) {
      setPin(pinIndex, true);
      currentPin[pinIndex - 1] = text;
      for (var e in currentPin) {
        strPin2 += e;
      }
      if (pinIndex == 4) {
        pinIndex = 0;
        // print(strPin);

        // var value = await DirectorService.getPin();
        var value = sharedService.pinCode;
        if (value == strPin2) {
          // bool passed = true;
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setBool('isLogged', true);
          // DirectorService.storegeInfo(true);
          sharedService.passed = true;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const NavScreen(
                  passed: true,
                ),
              ),
              (route) => false);
        } else {
          times = 0;
          pinPressed1 = false;
          pinPressed2 = false;
          pinPressed3 = false;
          pinPressed4 = false;

          pinPressed5 = false;
          pinPressed6 = false;
          pinPressed7 = false;
          pinPressed8 = false;
        }
      }
    }
  }

  setPin(int n, bool pressed) {
    switch (n) {
      case 1:
        setState(() {
          if (times == 1) {
            pinPressed5 = pressed;
          } else {
            pinPressed1 = pressed;
          }
        });
        break;
      case 2:
        setState(() {
          if (times == 1) {
            pinPressed6 = pressed;
          } else {
            pinPressed2 = pressed;
          }
        });
        break;
      case 3:
        setState(() {
          if (times == 1) {
            pinPressed7 = pressed;
          } else {
            pinPressed3 = pressed;
          }
        });
        break;
      case 4:
        setState(() {
          if (times == 1) {
            pinPressed8 = pressed;
          } else {
            pinPressed4 = pressed;
          }
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
}
