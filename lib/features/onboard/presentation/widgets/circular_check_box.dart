import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularCheckbox extends StatelessWidget {
  final bool value;

  const CircularCheckbox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      width: 35.w,
      height: 35.h,
      decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 24.0.w,
        height: 24.0.h,
        decoration: BoxDecoration(
          color: value ? const Color(0xFF046BC8) : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0.r),
        ),
      ),
    );
  }
}
