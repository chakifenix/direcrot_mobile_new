import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/dropdown_button.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/contingent_student/presentation/bloc/contingent_student_bloc.dart';
import 'package:direcrot_mobile_new/features/contingent_student/presentation/widgets/contingent_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContingentStudentPage extends StatefulWidget {
  final String? contingentType;
  final String positionName;
  final String allCount;
  final String manCount;
  final String womanCount;
  final String title;
  const ContingentStudentPage(
      {super.key,
      this.contingentType,
      required this.positionName,
      required this.allCount,
      required this.manCount,
      required this.womanCount,
      required this.title});

  @override
  State<ContingentStudentPage> createState() => _ContingentStudentPageState();
}

class _ContingentStudentPageState extends State<ContingentStudentPage> {
  int selectedValue = 1;
  final scrollController = ScrollController();

  final List<Map<String, dynamic>> items = [
    {'name': 'Отобразить все специальности', 'value': 1},
    {'name': 'Отобразить все классы', 'value': 2},
    {'name': 'Отобразить все по правам доступа', 'value': 3},
  ];

  final List<Map<String, dynamic>> itemsSkud = [
    {'name': 'Отобразить все действия', 'value': 1},
    {'name': 'Отобразить все классы', 'value': 2},
    {'name': 'Отобразить все по правам доступа', 'value': 3},
  ];

  final List<String> listInfo = ['Вход', 'Выход'];

  @override
  void initState() {
    super.initState();

    context
        .read<ContingentStudentBloc>()
        .add(const ContingentStudentDataFetch(page: 1));
    context.read<ContingentStudentBloc>().add(ContingentStudentGenderFetch());
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset >=
        (scrollController.position.maxScrollExtent - 50)) {
      context.read<ContingentStudentBloc>().add(ContingentStudentDataFetch());
    } else {}
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        body: BlocConsumer<ContingentStudentBloc, ContingentStudentState>(
          listener: (context, state) {},
          listenWhen: (previous, current) {
            if (current.isPaginationLoading)
              scrollController.removeListener(_scrollListener);
            else {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                scrollController.addListener(_scrollListener);
              });
            }
            return true;
          },
          builder: (context, state) {
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
                              // width: MediaQuery.of(context).size.width - 120,
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
                if (state.isGenderSuccess)
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
                          widget.positionName,
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
                                  'totalB'.tr(),
                                  style: AppTheme.infoRegularTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'boy'.tr(),
                                  style: AppTheme.infoRegularTextStyle,
                                ),
                                Text(
                                  'girl'.tr(),
                                  style: AppTheme.infoRegularTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.allCount,
                                  style: AppTheme.infoRegularTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  state.gender?.maleCount.toString() ?? '',
                                  style: AppTheme.infoRegularTextStyle,
                                ),
                                Text(
                                  state.gender?.femaleCount.toString() ?? '',
                                  style: AppTheme.infoRegularTextStyle,
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(9.w),
                              width: 86.w,
                              height: 86.h,
                              child: CircularProgressIndicator(
                                value: (state.gender?.femaleCount != null &&
                                        double.parse(widget.allCount) != 0)
                                    ? state.gender!.femaleCount /
                                        double.parse(widget.allCount)
                                    : 0,
                                color: const Color(0xFF008FCC),
                                backgroundColor: const Color(0xFFFFB800),
                                strokeWidth: 18,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                if (state.isGenderInitial) const Loader(),
                SizedBox(
                  height: 14.h,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 38.w, top: 23.h, bottom: 23.h, right: 38.w),
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (widget.title == 'СКУД')
                                      ? 'История учета'
                                      : 'profileData'.tr(),
                                  style: AppTheme.mainAppBarTextStyle,
                                ),
                                Text(
                                  'regisData'.tr(),
                                  style: AppTheme.mainSmallTextStyle,
                                ),
                              ],
                            ),
                            Image.asset('images/pdf_icon.png')
                          ],
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'filter'.tr(),
                              style: AppTheme.contingentDeatilRegularTextStyle,
                            ),
                            Expanded(
                              child: DropdownButtonCustom(
                                items: items,
                                selectedValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                                hintTitle: items[0]['name'],
                              ),
                            ),
                          ],
                        ),
                        (state.isSuccess)
                            ? Expanded(
                                child: ContingentList(
                                  controller: scrollController,
                                  listNames: state.studentListResponse,
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
