import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/cameras/presentation/pages/cameras_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevicesType extends StatelessWidget {
  const DevicesType({super.key, required this.title, required this.status});

  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title.contains('Видеокамера')) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CamerasPage()));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        decoration: const BoxDecoration(border: Border(top: BorderSide())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.mainMediumTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Серийный номер',
                  style: AppTheme.sendObrStatusTextStyle,
                )
              ],
            ),
            Container(
              width: 68.w,
              color: const Color(0xFF38AE00),
              child: Text(
                textAlign: TextAlign.center,
                status,
                style: AppTheme.sendObrSendedTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
