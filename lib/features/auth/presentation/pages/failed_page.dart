import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/login_page.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/support_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FailedPage extends StatelessWidget {
  const FailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 53.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 148.h,
            ),
            SvgPicture.asset(
              'images/x-icon.svg',
              width: 55.w,
              height: 53.h,
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              'authFailTitle'.tr(),
              style: AppTheme.authMediumTextStyle.copyWith(
                  color: const Color(0xFFE22626), fontWeight: FontWeight.bold),
            ),
            Text(
              'authFailCont'.tr(),
              style: AppTheme.authMediumTextStyle,
            ),
            SizedBox(
              height: 42.h,
            ),
            Text(
              'authFailPos'.tr(),
              style: AppTheme.authMediumTextStyle,
            ),
            SizedBox(
              height: 23.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. ',
                  style: AppTheme.authMediumTextStyle,
                ),
                SizedBox(
                  width: 279,
                  child: Text(
                    'authFail1'.tr(),
                    style: AppTheme.authMediumTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2. ',
                  style: AppTheme.authMediumTextStyle,
                ),
                SizedBox(
                  width: 275,
                  child: Text(
                    'authFail2'.tr(),
                    style: AppTheme.authMediumTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3. ',
                  style: AppTheme.authMediumTextStyle,
                ),
                SizedBox(
                  width: 275,
                  child: Text(
                    'authFail3'.tr(),
                    style: AppTheme.authMediumTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 43.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 60.w,
                ),
                SizedBox(
                    width: 170.w,
                    child: AppButton(
                        title: 'authFailKnow'.tr(),
                        pressAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SupportPage()));
                        })),
              ],
            ),
            SizedBox(
              height: 69.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    'authFailRe'.tr(),
                    style: AppTheme.authMediumTextStyle.copyWith(
                        color: const Color(0xFF046BC8),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
