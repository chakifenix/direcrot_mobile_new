import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/features/onboard/presentation/widgets/circular_check_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguagePage extends StatefulWidget {
  final PageController controller;
  const SelectLanguagePage({super.key, required this.controller});

  static Route route({required PageController controller}) => MaterialPageRoute(
      builder: (context) => SelectLanguagePage(
            controller: controller,
          ));

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  bool kazBox = false;
  bool rusBox = false;
  bool engBox = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 172.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                'images/logo_edus.png',
                width: 133.w,
                height: 31.h,
              ),
              SizedBox(
                height: 140.h,
              ),
              SizedBox(
                width: 293.w,
                child: Text(
                  'Предпочитаемый язык интерфейса',
                  style: AppTheme.lightThemeMode.textTheme.bodyMedium!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            kazBox = !kazBox;
                            rusBox = false;
                            engBox = false;
                          });
                        },
                        child: CircularCheckbox(
                          value: kazBox,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'Қазақша',
                        style: AppTheme.lightThemeMode.textTheme.bodyMedium!
                            .copyWith(fontSize: 20.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            kazBox = false;
                            rusBox = !rusBox;
                            engBox = false;
                          });
                        },
                        child: CircularCheckbox(
                          value: rusBox,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'Русский',
                        style: AppTheme.lightThemeMode.textTheme.bodyMedium!
                            .copyWith(fontSize: 20.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            kazBox = false;
                            rusBox = false;
                            engBox = !engBox;
                          });
                        },
                        child: CircularCheckbox(
                          value: engBox,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'English',
                        style: AppTheme.lightThemeMode.textTheme.bodyMedium!
                            .copyWith(fontSize: 20.sp),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 78.h,
              ),
              SizedBox(
                width: 170.w,
                child: AppButton(
                    title: 'Далее',
                    pressAction: () {
                      (rusBox)
                          ? context.setLocale(const Locale('ru'))
                          : (kazBox)
                              ? context.setLocale(const Locale('kk'))
                              : (engBox)
                                  ? context.setLocale(const Locale('en'))
                                  : 'return';
                      widget.controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
