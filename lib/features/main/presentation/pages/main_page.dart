import 'dart:io';

import 'package:direcrot_mobile_new/core/common/widgets/menu.dart';
import 'package:direcrot_mobile_new/features/devices/presentation/pages/devices_page.dart';
import 'package:direcrot_mobile_new/features/main/presentation/bloc/main_bloc.dart';
import 'package:direcrot_mobile_new/features/main/presentation/widgets/statistics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:direcrot_mobile_new/core/theme/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> _refresh() async {
    Future bloc = context.read<MainBloc>().stream.first;
    context.read<MainBloc>().add(TodayStatsFetch());
    await bloc;
  }

  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(TodayStatsFetch());
    context.read<MainBloc>().add(LicenseDataFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE6E6E6),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: BlocConsumer<MainBloc, MainState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.isSuccess) {
                  return Column(
                    children: [
                      Container(
                        height: 35.h,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 33.w, right: 27.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'welcome'.tr(),
                              style: AppTheme.mainMediumTextStyle,
                            ),
                            Image.asset('images/comment.png')
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 13.h, bottom: 13.h, left: 34.w, right: 27.w),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                (state.profileImage != null)
                                    ? ClipOval(
                                        child: Image.file(
                                          File(state.profileImage!),
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
                                SizedBox(
                                  width: 13.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 210,
                                      child: Text(
                                        state.name ?? '',
                                        style: AppTheme.mainMediumTextStyle
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'director'.tr(),
                                      style: TextStyle(fontSize: 11.sp),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              'images/logo_edus.png',
                              width: 52.w,
                              height: 12.h,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 13.h, bottom: 13.h, left: 33.w, right: 27.w),
                        color: const Color(0xFFFFB800),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 350.w,
                                  child: Text(
                                    'Мангистауская область, город Актау',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 350.w,
                                  child: Text(
                                    state.schoolName ?? '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        height: 123.h,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 35.w,
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'today'.tr(),
                                      style: AppTheme.mainMediumTextStyle
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF046BC8)),
                                    ),
                                    Text(
                                      'moment'.tr(),
                                      style: TextStyle(fontSize: 10.sp),
                                    )
                                  ],
                                ),
                                Image.asset('images/card.png')
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 23.w),
                              child: Column(
                                children: [
                                  Statistics(
                                    count:
                                        state.todayStats?.teacher.passed ?? 0,
                                    allCount:
                                        state.todayStats?.teacher.count ?? 0,
                                    color: const Color(0xFF38AE00),
                                    title: 'teacher'.tr(),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Statistics(
                                    count:
                                        state.todayStats?.student.passed ?? 0,
                                    allCount:
                                        state.todayStats?.student.count ?? 0,
                                    color: const Color(0xFF0069E3),
                                    title: 'student'.tr(),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Statistics(
                                    count:
                                        state.todayStats?.personal.passed ?? 0,
                                    allCount:
                                        state.todayStats?.personal.count ?? 0,
                                    color: const Color(0xFFFFB800),
                                    title: 'personal'.tr(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 23.h,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      (state.isLicenseSuccess)
                          ? Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DevicesPage(
                                                  licenseNo:
                                                      state.license?.license ??
                                                          '',
                                                  expire: DateFormat(
                                                          'dd.MM.yyyy')
                                                      .format(state.license
                                                              ?.dateExpire ??
                                                          DateTime.now()),
                                                )));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(right: 25.w),
                                    height: 37.h,
                                    color: const Color(0xFF046BC8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 97.w,
                                        ),
                                        Text(
                                          'license'.tr(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        ('${context.locale}' == 'kk')
                                            ? Text(
                                                '${DateFormat('dd.MM.yyyy').format(state.license?.dateExpire ?? DateTime.now())} дейін',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )
                                            : ('${context.locale}' == 'ru')
                                                ? Text(
                                                    'до ${DateFormat('dd.MM.yyyy').format(state.license?.dateExpire ?? DateTime.now())}',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    'to ${DateFormat('dd.MM.yyyy').format(state.license?.dateExpire ?? DateTime.now())}',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                        Text(
                                          'view'.tr(),
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 29.w),
                                  child: Image.asset('images/1.png'),
                                )
                              ],
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 36.w, right: 23.w, top: 28.h, bottom: 37.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'active'.tr(),
                                      style: AppTheme.mainMediumTextStyle
                                          .copyWith(
                                              color: const Color(0xFF046BC8),
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'components'.tr(),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                Image.asset(
                                  'images/logo_edus.png',
                                  width: 52.w,
                                  height: 12.h,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            SizedBox(
                              width: 400,
                              child: Wrap(
                                runSpacing: 22.h,
                                children: [
                                  Menu(
                                    title: 'contingent'.tr(),
                                    image: 'images/person.png',
                                    id: 1,
                                  ),
                                  Menu(
                                    title: 'skud'.tr(),
                                    image: 'images/2.png',
                                    id: 2,
                                  ),
                                  Menu(
                                    title: 'pitania'.tr(),
                                    image: 'images/3.png',
                                    id: 3,
                                  ),
                                  Menu(
                                    title: 'library'.tr(),
                                    image: 'images/4.png',
                                    color: const Color(0xFF777777),
                                    id: 4,
                                  ),
                                  Menu(
                                    title: 'camera'.tr(),
                                    image: 'images/5.png',
                                    id: 5,
                                  ),
                                  Menu(
                                    title: 'edu'.tr(),
                                    image: 'images/6.png',
                                    color: const Color(0xFF777777),
                                    id: 6,
                                  ),
                                  Menu(
                                    title: 'reports'.tr(),
                                    image: 'images/7.png',
                                    color: const Color(0xFF777777),
                                    id: 7,
                                  ),
                                  Menu(
                                    title: 'site'.tr(),
                                    image: 'images/8.png',
                                    color: const Color(0xFF777777),
                                    id: 8,
                                  ),
                                  Menu(
                                    title: 'security'.tr(),
                                    image: 'images/9.png',
                                    color: const Color(0xFF777777),
                                    id: 9,
                                  ),
                                  const Menu(
                                    title: 'Мессенджер',
                                    image: 'images/10.png',
                                    color: Color(0xFF777777),
                                    id: 10,
                                  ),
                                  Menu(
                                    title: 'statistics'.tr(),
                                    image: 'images/11.png',
                                    color: const Color(0xFF777777),
                                    id: 11,
                                  ),
                                  Menu(
                                    title: 'support'.tr(),
                                    image: 'images/12.png',
                                    id: 12,
                                  ),
                                  Menu(
                                    title: 'device'.tr(),
                                    image: 'images/13.png',
                                    id: 13,
                                    license: state.license?.license,
                                    expire: DateFormat('dd.MM.yyyy').format(
                                        state.license?.dateExpire ??
                                            DateTime.now()),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ));
  }
}
