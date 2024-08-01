import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class ProgressBarWidget extends StatelessWidget {
  final Color color;
  final double value;
  final int percent;
  const ProgressBarWidget({
    super.key,
    required this.color,
    required this.value,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProgressBar(
          height: 15.h,
          width: 178.w,
          value: value,
          color: color,
          backgroundColor: const Color(0xFFE6E6E6),
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          '$percent%',
          style: TextStyle(fontSize: 10.sp),
        )
      ],
    );
  }
}
