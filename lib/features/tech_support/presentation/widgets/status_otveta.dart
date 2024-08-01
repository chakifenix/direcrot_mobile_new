import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusOtveta extends StatelessWidget {
  const StatusOtveta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF38AE00),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Text(
          'answered'.tr(),
          style: AppTheme.sendObrSendedTextStyle,
        ));
  }
}
