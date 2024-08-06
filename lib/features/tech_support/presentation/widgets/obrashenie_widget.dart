import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/pages/tech_support_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ObrashenieWidget extends StatelessWidget {
  const ObrashenieWidget(
      {super.key,
      required this.id,
      required this.statusId,
      required this.statusName,
      required this.date,
      required this.initialMessage,
      required this.title});
  final String id;
  final int statusId;
  final String statusName;
  final String date;
  final String title;
  final String initialMessage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TechSupportDetail(
                    id: '$id',
                    statusId: statusId,
                    statusName: statusName,
                    date: date,
                    initialMessage: initialMessage,
                    title: title)));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 38.w, top: 17.h, right: 28.w, bottom: 14.h),
            color: (statusId == 1) ? Color(0xFFFFE9C9) : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '# $id',
                      style: AppTheme.sendObrIdTextStyle,
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
                        Container(
                            color: (statusId == 1)
                                ? Color(0xFFFFB800)
                                : (statusId == 2)
                                    ? Color(0xFFFF7A00)
                                    : (statusId == 3)
                                        ? Color(0xFF38AE00)
                                        : Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              statusName,
                              style: AppTheme.sendObrSendedTextStyle,
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  initialMessage,
                  style: AppTheme.sendObrContentTextStyle,
                ),
                Text(
                  date,
                  style: AppTheme.sendObrDateTextStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 9.h,
          )
        ],
      ),
    );
  }
}
