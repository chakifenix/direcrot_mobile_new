import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/core/util/show_snackbar.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/bloc/support_bloc.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/pages/individual_chat_screen.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/widgets/evaluate.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/widgets/status_otveta.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechSupportDetail extends StatefulWidget {
  final String id;
  final int statusId;
  final String statusName;
  final String date;
  final String title;
  final String initialMessage;
  final DateTime createdAt;
  final String ticketId;

  const TechSupportDetail(
      {super.key,
      required this.id,
      required this.statusId,
      required this.statusName,
      required this.date,
      required this.initialMessage,
      required this.title,
      required this.createdAt,
      required this.ticketId});

  @override
  State<TechSupportDetail> createState() => _TechSupportDetailState();
}

class _TechSupportDetailState extends State<TechSupportDetail> {
  @override
  void initState() {
    super.initState();
    context.read<SupportBloc>().add(GetChatListFetch(widget.ticketId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SupportBloc, SupportState>(
        listener: (context, state) {
          if (state.isEvaluateSuccess) {
            showSnackBar(context, state.evaluateSuccess ?? '');
          }
          if (state.isEvaluateFailure) {
            showSnackBar(context, state.error ?? '');
          }
        },
        builder: (context, state) {
          if (state.isDetailSuccess) {
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
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.only(top: 0),
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 24.h, horizontal: 37.w),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: 37.w, top: 35.h, right: 28.w, bottom: 23.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'requestNum'.tr(),
                                    style: AppTheme.sendObrStatusTextStyle,
                                  ),
                                  Text(
                                    '# ${widget.id}',
                                    style: AppTheme.sendObrIdTextStyle,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'status1'.tr(),
                                    style: AppTheme.sendObrStatusTextStyle,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  StatusOtveta(
                                    statusId: widget.statusId,
                                    statusName: widget.statusName,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 23.h,
                          ),
                          Text(
                            widget.date,
                            style: AppTheme.sendObrDateTextStyle,
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text(
                            widget.initialMessage,
                            style: AppTheme.sendObrContentTextStyle,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    for (int i = 0; i < state.chatList.length; i++)
                      Column(
                        children: [
                          (state.chatList[i].createdByType == 1)
                              ? Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: 37.w,
                                      top: 35.h,
                                      right: 28.w,
                                      bottom: 23.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'requestNum'.tr(),
                                                style: AppTheme
                                                    .sendObrStatusTextStyle,
                                              ),
                                              Text(
                                                '# ${widget.id}',
                                                style:
                                                    AppTheme.sendObrIdTextStyle,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'status1'.tr(),
                                                style: AppTheme
                                                    .sendObrStatusTextStyle,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              StatusOtveta(
                                                statusId: widget.statusId,
                                                statusName: widget.statusName,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 23.h,
                                      ),
                                      Text(
                                        DateFormat('dd.MM.yyyy HH:mm').format(
                                            state.chatList[i].createdAt),
                                        style: AppTheme.sendObrDateTextStyle,
                                      ),
                                      SizedBox(
                                        height: 11.h,
                                      ),
                                      Text(
                                        state.chatList[i].messageBody,
                                        style: AppTheme.sendObrContentTextStyle,
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.only(
                                      top: 24.h,
                                      left: 38.w,
                                      right: 28.w,
                                      bottom: 19.h),
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'supportResponse'.tr(),
                                        style: AppTheme.sendObrIdTextStyle,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            DateFormat('dd.MM.yyyy HH:mm')
                                                .format(state
                                                    .chatList[i].createdAt),
                                            style:
                                                AppTheme.sendObrDateTextStyle,
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            '${'manager'.tr()}: ${state.chatList[i].createdByName}',
                                            style:
                                                AppTheme.sendObrStatusTextStyle,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        state.chatList[i].messageBody,
                                        style: AppTheme.sendObrContentTextStyle,
                                      )
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                  ],
                )),

                SizedBox(
                  height: 14.h,
                ),
                AppButton(
                    title: 'writeChat'.tr(),
                    pressAction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IndividualScreen(
                                    statusId: widget.statusId,
                                    ticketId: widget.ticketId,
                                    receiverEmail: 'receiverEmail',
                                    receiverID: 'receiverID',
                                    fullName: 'fullName',
                                    createdAt: widget.createdAt,
                                    initMessage: widget.initialMessage,
                                  )));
                    }),
                SizedBox(
                  height: 14.h,
                ),
                AppButton(
                    title: 'evaluate'.tr(),
                    pressAction: () {
                      if (widget.statusId != 4) {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return EvaluateWidget(
                                path: widget.ticketId,
                              );
                            });
                      }
                    }),
                SizedBox(
                  height: 30.h,
                )
                // SizedBox(
                //   height: 14.h,
                // ),
                // Container(
                //   padding: EdgeInsets.only(
                //       left: 38.w, top: 14.h, right: 40.w, bottom: 17.h),
                //   color: Colors.white,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'history'.tr(),
                //         style: AppTheme.sendObrIdTextStyle,
                //       ),
                //       SizedBox(
                //         height: 25.h,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '02.05.2024 18:07',
                //             style: AppTheme.sendObrContentTextStyle,
                //           ),
                //           const StatusOtveta(),
                //           Text(
                //             'requestSent'.tr(),
                //             style: AppTheme.sendObrStatusTextStyle,
                //           )
                //         ],
                //       ),
                //       SizedBox(
                //         height: 18.h,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '02.05.2024 18:07',
                //             style: AppTheme.sendObrContentTextStyle,
                //           ),
                //           const StatusOtveta(),
                //           Text(
                //             'requestSent'.tr(),
                //             style: AppTheme.sendObrStatusTextStyle,
                //           )
                //         ],
                //       ),
                //       SizedBox(
                //         height: 18.h,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             '02.05.2024 18:07',
                //             style: AppTheme.sendObrContentTextStyle,
                //           ),
                //           const StatusOtveta(),
                //           Text(
                //             'requestSent'.tr(),
                //             style: AppTheme.sendObrStatusTextStyle,
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // )
              ],
            );
          }
          return Loader();
        },
      ),
    );
  }
}
