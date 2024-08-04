import 'package:direcrot_mobile_new/core/common/widgets/dropdown_button.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/lgotniki/presentation/bloc/lgotniki_bloc.dart';
import 'package:direcrot_mobile_new/features/lgotniki/presentation/widgets/lgotniki_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LgotnikiPage extends StatefulWidget {
  const LgotnikiPage({
    super.key,
  });

  @override
  State<LgotnikiPage> createState() => _LgotnikiPageState();
}

class _LgotnikiPageState extends State<LgotnikiPage> {
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

    context.read<LgotnikiBloc>().add(const LgotnikiDataFetch(page: 1));
    context.read<LgotnikiBloc>().add(LgotnikiGenderFetch());
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset >=
        (scrollController.position.maxScrollExtent - 50)) {
      context.read<LgotnikiBloc>().add(const LgotnikiDataFetch());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LgotnikiBloc, LgotnikiState>(
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
          int allCount = 0;
          if (state.genderCount != null) {
            allCount =
                state.genderCount!.femaleCount + state.genderCount!.maleCount;
          }

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
                        'benefic'.tr(),
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
                          'benefic'.tr(),
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
                        'benefic'.tr(),
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
                                'all'.tr(),
                                style: AppTheme.infoRegularTextStyle
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'mans'.tr(),
                                style: AppTheme.infoRegularTextStyle,
                              ),
                              Text(
                                'womans'.tr(),
                                style: AppTheme.infoRegularTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allCount.toString(),
                                style: AppTheme.infoRegularTextStyle
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.genderCount?.maleCount.toString() ?? '',
                                style: AppTheme.infoRegularTextStyle,
                              ),
                              Text(
                                state.genderCount?.femaleCount.toString() ?? '',
                                style: AppTheme.infoRegularTextStyle,
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(9.w),
                            width: 86.w,
                            height: 86.h,
                            child: CircularProgressIndicator(
                              value: (state.genderCount?.femaleCount != null &&
                                      (allCount) != 0)
                                  ? state.genderCount!.femaleCount / allCount
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
              // if (state.isGenderInitial) const Loader(),
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
                                'profileData'.tr(),
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
                              child: LgotnikiList(
                                controller: scrollController,
                                listNames: state.lgotnikiResponse,
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
    );
  }
}
