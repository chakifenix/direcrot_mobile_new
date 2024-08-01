import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dots extends StatelessWidget {
  const Dots({super.key, required this.pinPressed});
  final bool pinPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 35.h,
      padding: EdgeInsets.all(5.w),
      decoration:
          BoxDecoration(color: Color(0xFFBBBBBB), shape: BoxShape.circle),
      child: pinPressed
          ? Container(
              width: 24.w,
              height: 24.h,
              decoration: const BoxDecoration(
                  color: Color(0xFF046BC8), shape: BoxShape.circle))
          : const SizedBox(),
    );
  }
}
