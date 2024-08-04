import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardFirst extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle1;
  final String subTitle2;
  final PageController controller;
  const OnboardFirst(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle1,
      required this.subTitle2,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Image.asset(image),
          Positioned(
              left: 300.w,
              top: 75.h,
              child: Image.asset(
                'images/logo_sp.png',
                width: 80.w,
                height: 80.h,
              )),
          Positioned(
            top: 380.h,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF046BC8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 190.h,
                    ),
                    SizedBox(
                      child: Text(
                        title,
                        style: AppTheme.displayLarge
                            .copyWith(color: Colors.white, letterSpacing: -2),
                      ),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: subTitle1,
                            style: AppTheme.displayMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                            // AppTheme
                            //     .lightThemeMode.textTheme.displayMedium!
                            //     .copyWith(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold),
                            ),
                        // TextSpan(
                        //     text: subTitle2,
                        //     style: AppTheme
                        //         .lightThemeMode.textTheme.displayMedium!
                        //         .copyWith(color: Colors.white))
                      ]),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 190.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.w),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: CupertinoButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 6.h),
                          color: Colors.transparent,
                          child: FittedBox(
                              fit: BoxFit.scaleDown, child: Text('next'.tr())),
                          onPressed: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / size.width, 250.h, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
