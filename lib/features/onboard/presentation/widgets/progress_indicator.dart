import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressIndicator1 extends StatelessWidget {
  const ProgressIndicator1({
    super.key,
    required Animation<double> animation,
  }) : animation = animation;

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: LinearProgressIndicator(
        minHeight: 10.h,
        value: animation.value,
        valueColor: const AlwaysStoppedAnimation(Color(0xFF046BC8)),
        backgroundColor: const Color(0xFFFFB800),
      ),
    );
  }
}
