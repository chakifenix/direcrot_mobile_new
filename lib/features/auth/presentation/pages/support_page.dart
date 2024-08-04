import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 75.w, right: 43.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 164.h,
                  ),
                  Text(
                    'write'.tr(),
                    style: AppTheme.authLargeTextStyle,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'fName'.tr(),
                          style: AppTheme.authMediumTextStyle),
                      TextSpan(
                          text: '*',
                          style: AppTheme.authMediumTextStyle
                              .copyWith(color: const Color(0xFFE22626)))
                    ]),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    decoration: AppTheme.inputDecoration,
                    style: const TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'contact'.tr(),
                          style: AppTheme.authMediumTextStyle),
                      TextSpan(
                          text: '*',
                          style: AppTheme.authMediumTextStyle
                              .copyWith(color: const Color(0xFFE22626)))
                    ]),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    decoration: AppTheme.inputDecoration,
                    style: const TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'message'.tr(),
                          style: AppTheme.authMediumTextStyle),
                      TextSpan(
                          text: '*',
                          style: AppTheme.authMediumTextStyle
                              .copyWith(color: const Color(0xFFE22626)))
                    ]),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    maxLines: 5,
                    decoration: AppTheme.inputDecoration,
                    style: const TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 170.w,
                    child: AppButton(title: 'send'.tr(), pressAction: () {})),
              ],
            ),
            SizedBox(
              height: 69.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'authFailRe'.tr(),
                    style: AppTheme.authMediumTextStyle.copyWith(
                        color: const Color(0xFF046BC8),
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
