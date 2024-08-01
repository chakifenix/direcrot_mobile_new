import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/pages/tech_support_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ObrashenieWidget extends StatelessWidget {
  const ObrashenieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TechSupportDetail()));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 38.w, top: 17.h, right: 28.w, bottom: 14.h),
            color: const Color(0xFFFFE9C9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '# 200132201',
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
                            color: const Color(0xFFFFB800),
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              'sent'.tr(),
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
                  'Сұрақ, жүйе ата-аналарға балаларының үлгерімін бақылауға, сабақ кестесін  білуге ...',
                  style: AppTheme.sendObrContentTextStyle,
                ),
                Text(
                  '04.05.2024 13:44',
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
