import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/bloc/contingent_bloc.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/pages/contingent_detail_page.dart';
import 'package:direcrot_mobile_new/features/contingent_student/presentation/pages/contingent_student_page.dart';
import 'package:direcrot_mobile_new/features/lgotniki/presentation/pages/lgotniki_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContingentPage extends StatefulWidget {
  const ContingentPage({
    super.key,
  });

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

  int touchedIndex = -1;

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
                              'contingent'.tr(),
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
                                'contingent'.tr(),
                                style: AppTheme.mainAppBarTextStyle
                                    .copyWith(color: Colors.white),
                              ),
                              SizedBox(
                                  // width:
                                  //     MediaQuery.of(context).size.width - 120.w,
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
                            'statistics'.tr(),
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
                              // Container(
                              //   padding: EdgeInsets.all(9.w),
                              //   width: 86.w,
                              //   height: 86.h,
                              //   child: const CircularProgressIndicator(
                              //     value: 0.7,
                              //     color: Color(0xFF008FCC),
                              //     backgroundColor: Color(0xFFFFB800),
                              //     strokeWidth: 18,
                              //   ),
                              // )
                              Container(
                                width: 86.w,
                                height: 86.h,
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(
                                      touchCallback: (FlTouchEvent event,
                                          pieTouchResponse) {
                                        setState(() {
                                          if (!event
                                                  .isInterestedForInteractions ||
                                              pieTouchResponse == null ||
                                              pieTouchResponse.touchedSection ==
                                                  null) {
                                            touchedIndex = -1;
                                            return;
                                          }
                                          touchedIndex = pieTouchResponse
                                              .touchedSection!
                                              .touchedSectionIndex;
                                        });
                                      },
                                    ),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 25,
                                    sections: showingSections(
                                        student:
                                            state.contingentData?.student ?? 0,
                                        teacher:
                                            state.contingentData?.teacher ?? 0,
                                        personal:
                                            state.contingentData?.personnel ??
                                                0),
                                  ),
                                ),
                              ),
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

  List<PieChartSectionData> showingSections(
      {required int student, required int personal, required int teacher}) {
    int allCount = student + personal + teacher;
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 14.sp;
      final radius = isTouched ? 28.0 : 20.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            value: teacher.toDouble(),
            title: (allCount != 0) ? '${(teacher * 100) ~/ allCount}%' : '0',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.blue,
            value: student.toDouble(),
            title: (allCount != 0) ? '${(student * 100) ~/ allCount}%' : '0',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.yellow,
            value: personal.toDouble(),
            title: (allCount != 0) ? '${(personal * 100) ~/ allCount}%' : '0',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );

        default:
          throw Error();
      }
    });
  }
}
