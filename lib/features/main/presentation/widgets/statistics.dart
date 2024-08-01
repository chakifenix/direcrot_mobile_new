import 'package:direcrot_mobile_new/features/main/presentation/widgets/progress_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Statistics extends StatelessWidget {
  final int allCount;
  final int count;
  final String title;
  final Color color;
  const Statistics(
      {super.key,
      required this.allCount,
      required this.count,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(
              height: 7.h,
            ),
            ProgressBarWidget(
              color: color,
              value: (allCount != 0) ? count / allCount : 0,
              percent: (allCount != 0) ? ((count / allCount) * 100).floor() : 0,
            )
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$count',
                style: TextStyle(fontSize: 32, height: 0.8, color: color),
              ),
              Text(
                'total'.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
              Text(
                '$allCount',
                style: TextStyle(fontSize: 20.sp),
              )
            ],
          ),
        )
      ],
    );
  }
}
