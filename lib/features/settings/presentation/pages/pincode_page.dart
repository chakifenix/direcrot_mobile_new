import 'package:direcrot_mobile_new/init_dependencies.dart';
import 'package:direcrot_mobile_new/services/shared_preferences_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PincodePage extends StatefulWidget {
  const PincodePage({
    super.key,
  });

  @override
  State<PincodePage> createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  final sharedService = serviceLocator<SharedPreferencesService>();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  String? currentPin;
  bool confirm = false;
  String newPin1 = '';
  String newPin2 = '';
  getPin() async {
    currentPin = sharedService.pinCode;
  }

  @override
  void initState() {
    super.initState();
    getPin();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 32.w,
        height: 37.h,
        textStyle: TextStyle(fontSize: 22.sp, color: Colors.black),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.blue)));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color(0xFF123088),
        title: Text(
          'pinCode'.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 27.h,
              ),
              Text(
                'pinkod_ozgertu'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'pin_text'.tr(),
                style: TextStyle(
                  color: const Color(0xFFB2AFAF),
                  fontSize: 16.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 29.h,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Pinput(
                      enabled: (!confirm),
                      controller: otpController,
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      keyboardType: TextInputType.number,
                      validator: (otp) {
                        if (otp == currentPin) {
                          setState(() {
                            confirm = true;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('OTP is invalid'),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          otpController.clear();
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    (confirm == true)
                        ? Image.asset('images/confirm.png')
                        : const SizedBox()
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              (confirm == true)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'new_pin'.tr(),
                          style: TextStyle(
                            color: const Color(0xFF090000),
                            fontSize: 20.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Pinput(
                          controller: otpController1,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value != null) {
                              newPin1 = value;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Pinput(
                          controller: otpController2,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value != null) {
                              newPin2 = value;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 349.w,
                          height: 32.h,
                          child: CupertinoButton(
                            padding: EdgeInsets.symmetric(vertical: 0.h),
                            color: const Color(0xFF123088),
                            onPressed: () async {
                              if (newPin1 == newPin2) {
                                sharedService.pinCode = newPin1;
                                Navigator.pop(context);
                              } else {
                                otpController1.clear();
                                otpController2.clear();
                              }
                            },
                            child: Text(
                              'save'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
