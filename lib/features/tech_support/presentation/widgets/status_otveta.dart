import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusOtveta extends StatelessWidget {
  final String statusName;
  final int statusId;
  const StatusOtveta({
    super.key,
    required this.statusId,
    required this.statusName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
