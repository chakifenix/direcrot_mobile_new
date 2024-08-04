import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/dropdown_button.dart';
import 'package:direcrot_mobile_new/features/pitania/presentation/bloc/pitania_bloc.dart';
import 'package:direcrot_mobile_new/features/pitania/presentation/widgets/pitania_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PitaniaPage extends StatefulWidget {
  final title;
  PitaniaPage({super.key, this.title});

  @override
  State<PitaniaPage> createState() => _PitaniaPageState();
}

class _PitaniaPageState extends State<PitaniaPage> {
  int selectedValue = 1;
  int? classFrom;
  int? classTo;
  String? dateFrom;
  String? dateTo;
  final scrollController = ScrollController();
  DateTimeRange selectedDates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  final List<Map<String, dynamic>> items = [
    {'name': 'all'.tr(), 'value': 1},
    {'name': '1-4 ${'class'.tr()}', 'value': 2},
    {'name': 'benefic'.tr(), 'value': 3},
  ];

  final List<String> listInfo = ['enter'.tr(), 'exit'.tr()];

  @override
  void initState() {
    super.initState();

    context.read<PitaniaBloc>().add(const PitaniaListFetch(page: 1));
    context.read<PitaniaBloc>().add(PitaniaCountFetch());
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset >=
        (scrollController.position.maxScrollExtent - 50)) {
      context.read<PitaniaBloc>().add(const PitaniaListFetch());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PitaniaBloc, PitaniaState>(
        listener: (context, state) {},
        listenWhen: (previous, current) {
          if (current.isPaginationLoading) {
            scrollController.removeListener(_scrollListener);
          } else {
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
                        'pitania'.tr(),
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
                          'pitania'.tr(),
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
              (state.isCountSuccess)
                  ? Container(
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
                            'freeFood'.tr(),
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
                                    'benefic'.tr(),
                                    style: AppTheme.infoRegularTextStyle,
                                  ),
                                  Text(
                                    '1-4 ${'class'.tr()}',
                                    style: AppTheme.infoRegularTextStyle,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.pitaniaMetaEntityBenefic!.total.toInt() + state.pitaniaLowClass!.total.toInt()}',
                                    style: AppTheme.infoRegularTextStyle
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${state.pitaniaMetaEntityBenefic?.total}',
                                    style: AppTheme.infoRegularTextStyle,
                                  ),
                                  Text(
                                    '${state.pitaniaLowClass?.total}',
                                    style: AppTheme.infoRegularTextStyle,
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(9.w),
                                width: 86.w,
                                height: 86.h,
                                child: CircularProgressIndicator(
                                  value: state.pitaniaMetaEntityBenefic!.total
                                          .toInt() /
                                      (state.pitaniaMetaEntityBenefic!.total
                                              .toInt() +
                                          state.pitaniaLowClass!.total.toInt()),
                                  color: const Color(0xFF008FCC),
                                  backgroundColor: const Color(0xFFFFB800),
                                  strokeWidth: 18,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : const Loader(),
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
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: DropdownButtonCustom(
                              items: items,
                              selectedValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                                if (value == 2) {
                                  classFrom = 1;
                                  classTo = 4;
                                }
                                if (value == 1) {
                                  classFrom = null;
                                  classTo = null;
                                }
                                if (value == 3) {
                                  classFrom = 5;
                                  classTo = 11;
                                }

                                context.read<PitaniaBloc>().add(
                                    PitaniaListFetch(
                                        page: 1,
                                        classFrom: classFrom,
                                        classTo: classTo,
                                        dateFrom: dateFrom,
                                        dateTo: dateTo));
                              },
                              hintTitle: items[0]['name'],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                              onTap: () async {
                                final pitaniaBloc = context.read<PitaniaBloc>();
                                final DateTimeRange? dateTimeRange =
                                    await showDateRangePicker(
                                        context: context,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(3000),
                                        initialDateRange: selectedDates);
                                if (dateTimeRange != null) {
                                  setState(() {
                                    selectedDates = dateTimeRange;
                                    dateFrom = DateFormat('yyyy-MM-dd')
                                        .format(dateTimeRange.start);
                                    dateTo = DateFormat('yyyy-MM-dd')
                                        .format(dateTimeRange.end);
                                  });
                                }
                                pitaniaBloc.add(PitaniaListFetch(
                                    page: 1,
                                    classFrom: classFrom,
                                    classTo: classTo,
                                    dateFrom: dateFrom,
                                    dateTo: dateTo));
                              },
                              child: const Icon(Icons.calendar_month_outlined))
                        ],
                      ),
                      (dateFrom == null)
                          ? SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${DateFormat('dd.MM.yyyy').format(selectedDates.start)}-${DateFormat('dd.MM.yyyy').format(selectedDates.end)}'),
                                GestureDetector(
                                  onTap: () {
                                    dateFrom =null;
                                    dateTo = null;
                                    context.read<PitaniaBloc>().add(PitaniaListFetch(
                                    page: 1,
                                    classFrom: null,
                                    classTo: null,
                                    dateFrom: dateFrom,
                                    dateTo: dateTo));
                                  },
                                  child: Text(
                                    'reset'.tr(),
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue),
                                  ),
                                )
                              ],
                            ),
                      (state.isSuccess)
                          ? Expanded(
                              child: PitaniaList(
                                  listNames: state.pitaniaResponse,
                                  controller: scrollController))
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
