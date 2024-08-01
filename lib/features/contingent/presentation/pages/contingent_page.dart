import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/bloc/contingent_bloc.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/pages/contingent_detail_page.dart';
import 'package:direcrot_mobile_new/features/contingent_student/presentation/pages/contingent_student_page.dart';
import 'package:direcrot_mobile_new/features/lgotniki/presentation/pages/lgotniki_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContingentPage extends StatefulWidget {
  final String title;
  const ContingentPage({super.key, required this.title});

  @override
  State<ContingentPage> createState() => _ContingentPageState();
}

class _ContingentPageState extends State<ContingentPage> {
  @override
  void initState() {
    super.initState();
    context.read<ContingentBloc>().add(ContingentDataFetch());
  }

  Future<void> _refresh() async {
    Future timeout = Future.delayed(const Duration(seconds: 3));
    Future bloc = context.read<ContingentBloc>().stream.first;
    context.read<ContingentBloc>().add(ContingentDataFetch());
    await Future.any([bloc, timeout]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocConsumer<ContingentBloc, ContingentState>(
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
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 33.w, right: 27.w, top: 20.h, bottom: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: AppTheme.mainMediumTextStyle
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 38.w, top: 24.h, bottom: 24.h, right: 24.w),
                      color: const Color(0xFF046BC8),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(7.w),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Image.asset('images/persons.png')),
                          SizedBox(
                            width: 18.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: AppTheme.mainAppBarTextStyle
                                    .copyWith(color: Colors.white),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 120,
                                  child: Text(
                                    'manage'.tr(),
                                    style: AppTheme.mainAppBarSmallTextStyle
                                        .copyWith(color: Colors.white),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 38.w,
                        right: 36.w,
                        top: 22.h,
                        bottom: 22.h,
                      ),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Статистика',
                            style: AppTheme.mainAppBarTextStyle,
                          ),
                          Text(
                            'regisData'.tr(),
                            style: AppTheme.mainSmallTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'teacher'.tr(),
                                    style: AppTheme.infoRegularTextStyle,
                                  ),
                                  Text(
                                    'student'.tr(),
                                    style: AppTheme.infoRegularTextStyle,
                                  ),
                                  Text(
                                    'personal'.tr(),
                                    style: AppTheme.infoRegularTextStyle,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.contingentData?.teacher.toString() ??
                                        '',
                                    style: AppTheme.infoRegularTextStyle,
                                  ),
                                  Text(
                                    state.contingentData?.student.toString() ??
                                        '',
                                    style: AppTheme.infoRegularTextStyle,
                                  ),
                                  Text(
                                    state.contingentData?.personnel
                                            .toString() ??
                                        '',
                                    style: AppTheme.infoRegularTextStyle,
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(9.w),
                                width: 86.w,
                                height: 86.h,
                                child: const CircularProgressIndicator(
                                  value: 0.7,
                                  color: Color(0xFF008FCC),
                                  backgroundColor: Color(0xFFFFB800),
                                  strokeWidth: 18,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 38.w, top: 23.h, bottom: 23.h, right: 38.w),
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'profileUsers'.tr(),
                            style: AppTheme.mainAppBarTextStyle,
                          ),
                          Text(
                            'regisData'.tr(),
                            style: AppTheme.mainSmallTextStyle,
                          ),
                          SizedBox(
                            height: 27.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>
                                              ContingentDetailPage(
                                                  contingentType: 'учитель',
                                                  title: 'contingent'.tr(),
                                                  positionName: 'teacherB'.tr(),
                                                  allCount: state.contingentData
                                                          ?.teacher
                                                          .toString() ??
                                                      '',
                                                  manCount: '11',
                                                  womanCount: '60'))));
                                },
                                child: SizedBox(
                                  width: 110.w,
                                  child: Column(
                                    children: [
                                      Image.asset('images/person.png'),
                                      Text('teacherB'.tr())
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>
                                              ContingentStudentPage(
                                                  positionName: 'studentB'.tr(),
                                                  allCount: state.contingentData
                                                          ?.student
                                                          .toString() ??
                                                      '',
                                                  manCount: '10',
                                                  womanCount: '10',
                                                  title: 'contingent'.tr()))));
                                },
                                child: SizedBox(
                                  width: 110.w,
                                  child: Column(
                                    children: [
                                      Image.asset('images/person.png'),
                                      Text('studentB'.tr())
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>
                                              ContingentDetailPage(
                                                  contingentType: 'персонал',
                                                  title: 'contingent'.tr(),
                                                  positionName:
                                                      'personalB'.tr(),
                                                  allCount: state.contingentData
                                                          ?.personnel
                                                          .toString() ??
                                                      '',
                                                  manCount: '11',
                                                  womanCount: '60'))));
                                },
                                child: SizedBox(
                                  width: 110.w,
                                  child: Column(
                                    children: [
                                      Image.asset('images/person.png'),
                                      FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text('personalB'.tr()))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 110.w,
                                child: Column(
                                  children: [
                                    Image.asset('images/person.png'),
                                    Text('parrents'.tr())
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LgotnikiPage()));
                                },
                                child: SizedBox(
                                  width: 110.w,
                                  child: Column(
                                    children: [
                                      Image.asset('images/person.png'),
                                      FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text('benefic'.tr()))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110.w,
                                child: Column(
                                  children: [
                                    Image.asset('images/person.png'),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text('admins'.tr()))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    )
                  ],
                );
              }
              if (state.isLoading) {
                return Column(
                  children: [
                    SizedBox(
                      height: 300.h,
                    ),
                    const Loader(),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
