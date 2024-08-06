import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/bloc/support_bloc.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/pages/send_problem.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/widgets/obrashenie_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class TechSupport extends StatefulWidget {
  TechSupport({super.key});

  @override
  State<TechSupport> createState() => _TechSupportState();
}

class _TechSupportState extends State<TechSupport> {
  final url =
      Uri.parse('https://support.edus.kz/public/ru/v1/ticket/create-ticket');

  @override
  void initState() {
    super.initState();
    context.read<SupportBloc>().add(TicketListFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SupportBloc, SupportState>(
        builder: (context, state) {
          if (state.isSuccess) {
            int countAnswered = state.ticketList
                .where((element) => element.statusId == 1)
                .length;
            int countProcess = state.ticketList
                .where((element) => element.statusId == 2)
                .length;

            double procentAnswered =
                (countAnswered * 100) / state.ticketList.length;
            return Column(
              children: [
                Container(
                  height: 35.h,
                  color: const Color(0xB3FFFFFF),
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
                          'support'.tr(),
                          style: AppTheme.mainMediumTextStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 37.w),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'requests'.tr(),
                            style: AppTheme.mainAppBarTextStyle,
                          ),
                          Text(
                            'status'.tr(),
                            style: AppTheme.activitySmallTextStyle,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // _launchURL(url);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTicketPage()));
                        },
                        child: Container(
                          width: 27.w,
                          height: 27.h,
                          padding: EdgeInsets.only(bottom: 3.h),
                          decoration: const BoxDecoration(
                              color: Color(0xFFFF7A00), shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  color: Colors.white,
                                  height: 0.7),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 37.w, right: 37.w, bottom: 6.h, top: 13.h),
                      width: 321.w,
                      height: 95.h,
                      color: const Color(0xB3FFFFFF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'statisticsRequest'.tr(),
                            style: AppTheme.statisticObrTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'allRequests'.tr(),
                                    style: AppTheme.allObrTextStyle,
                                  ),
                                  Text(
                                    '${state.ticketList.length}',
                                    style: AppTheme.resultObrTextStyle,
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'answered'.tr(),
                                    style: AppTheme.allObrTextStyle,
                                  ),
                                  Text(
                                    '$countAnswered',
                                    style: AppTheme.resultObrTextStyle.copyWith(
                                        color: const Color(0xFF38AE00)),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'inProcess'.tr(),
                                    style: AppTheme.allObrTextStyle,
                                  ),
                                  Text(
                                    '$countProcess',
                                    style: AppTheme.resultObrTextStyle.copyWith(
                                        color: const Color(0xFFFF7A00)),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 6.h),
                      alignment: Alignment.bottomCenter,
                      width: 109.w,
                      height: 95.h,
                      color: Colors.blue,
                      child: Text(
                        '${procentAnswered.toInt()}%',
                        style: AppTheme.resultObrTextStyle
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: state.ticketList.length,
                        itemBuilder: (context, index) {
                          return ObrashenieWidget(
                            id: state.ticketList[index].id.toString(),
                            statusId: state.ticketList[index].statusId,
                            statusName: state.ticketList[index].statusName,
                            date: DateFormat('dd.MM.yyyy HH:mm')
                                .format(state.ticketList[index].createdAt),
                            initialMessage:
                                state.ticketList[index].initialMessage,
                            title: state.ticketList[index].title,
                          );
                        })),
                // const ObrashenieWidget()
              ],
            );
          }
          if (state.isFailure) {
            return Center(
              child: Text(state.error ?? ''),
            );
          }
          return Loader();
        },
      ),
    );
  }

  _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
