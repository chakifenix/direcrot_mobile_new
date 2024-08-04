import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.pressAction});
  final String title;
  final VoidCallback pressAction;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        color: const Color(0xFF046BC8),
        onPressed: pressAction,
        child: Text(
          title,
          style: AppTheme.bodyMedium
              .copyWith(color: Colors.white, fontSize: 20.sp),
        ));
  }
}

class AppInactiveButton extends StatelessWidget {
  const AppInactiveButton(
      {super.key, required this.title, required this.pressAction});
  final String title;
  final VoidCallback pressAction;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.all(0),
        color: const Color(0x4C046BC8),
        onPressed: pressAction,
        child: Text(
          title,
          style: AppTheme.bodyMedium
              .copyWith(color: Colors.white, fontSize: 20.sp),
        ));
  }
}
