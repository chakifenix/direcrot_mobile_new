import 'dart:io';

import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/bloc/contingent_bloc.dart';
import 'package:direcrot_mobile_new/features/information/presentation/bloc/news_bloc.dart';
import 'package:direcrot_mobile_new/features/main/presentation/bloc/main_bloc.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:direcrot_mobile_new/services/session_manager/session_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool kazBox = false;
  bool rusBox = false;
  bool engBox = false;

  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(LoadUserInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F9FF),
        appBar: AppBar(
            leading: const BackButton(color: Colors.blue),
            elevation: 0,
            backgroundColor: const Color(0xFFF5F9FF),
            title: Text(
              'language'.tr(),
              style: TextStyle(
                color: const Color(0xFF1F2024),
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )),
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 11.h),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state.isSuccess) {
                return Column(
                  children: [
                    Row(
                      children: [
                        (state.imagePath != null)
                            ? ClipOval(
                                child: Image.file(
                                  File(
                                    state.imagePath!,
                                  ),
                                  width: 58.w,
                                  height: 58.h,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : CircleAvatar(
                                radius: 35.r,
                              ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 250.w,
                              child: Text(
                                state.fullName ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250.w,
                              child: Text(
                                state.schoolName ?? '',
                                style: TextStyle(
                                  color: const Color(0xFF817F9B),
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 11.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      height: 539.h,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                kazBox = !kazBox;
                                rusBox = false;
                                engBox = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 0.5.w,
                                          color: const Color(0xFF817F9B)))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Қазақ тілі',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                    width: 17.w,
                                    child: CupertinoCheckbox(
                                      value: kazBox,
                                      onChanged: (value) {
                                        setState(() {
                                          kazBox = !kazBox;
                                          rusBox = false;
                                          engBox = false;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                rusBox = !rusBox;
                                kazBox = false;
                                engBox = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 0.5.w,
                                          color: const Color(0xFF817F9B)))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Русский язык',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                    width: 17.w,
                                    child: CupertinoCheckbox(
                                      value: rusBox,
                                      onChanged: (value) {
                                        setState(() {
                                          rusBox = !rusBox;
                                          kazBox = false;
                                          engBox = false;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                engBox = !engBox;
                                rusBox = false;
                                kazBox = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 0.5.w,
                                          color: const Color(0xFF817F9B)))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'English language',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                    width: 17.w,
                                    child: CupertinoCheckbox(
                                      value: engBox,
                                      onChanged: (value) {
                                        setState(() {
                                          engBox = !engBox;
                                          rusBox = false;
                                          kazBox = false;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 67.35.h,
                          ),
                          SizedBox(
                              width: 250.w,
                              child: AppButton(
                                  title: 'save'.tr(),
                                  pressAction: () {
                                    (rusBox)
                                        ? context.setLocale(const Locale('ru'))
                                        : (kazBox)
                                            ? context
                                                .setLocale(const Locale('kk'))
                                            : (engBox)
                                                ? context.setLocale(
                                                    const Locale('en'))
                                                : 'return';
                                    context
                                        .read<MainBloc>()
                                        .add(TodayStatsFetch());
                                    context
                                        .read<SettingsBloc>()
                                        .add(LoadUserInfo());
                                    context.read<NewsBloc>().add(GetArticles());
                                    context
                                        .read<ContingentBloc>()
                                        .add(ContingentDataFetch());
                                    SessionController()
                                        .saveLanguageCode('${context.locale}');
                                    Navigator.pop(context, context.locale);
                                  }))
                        ],
                      ),
                    )
                  ],
                );
              }
              return Center(
                child: const Loader(),
              );
            },
          ),
        ));
  }
}
