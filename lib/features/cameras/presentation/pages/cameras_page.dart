import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CamerasPage extends StatefulWidget {
  const CamerasPage({super.key});

  @override
  State<CamerasPage> createState() => _CamerasPageState();
}

class _CamerasPageState extends State<CamerasPage> {
  bool cameraTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            cameraTapped = false;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 35.h,
                  color: const Color(0xB3FFFFFF),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 33.w, right: 27.w, top: 20.h, bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'device'.tr(),
                          style: AppTheme.mainMediumTextStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 38.w, top: 24.h, bottom: 24.h, right: 24.w),
                  color: const Color(0xFF046BC8),
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(7.w),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Image.asset('images/camera.png')),
                      SizedBox(
                        width: 18.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'video'.tr(),
                            style: AppTheme.mainAppBarTextStyle
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 120,
                              child: Text(
                                'onlineStream'.tr(),
                                style: AppTheme.mainAppBarSmallTextStyle
                                    .copyWith(color: Colors.white),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.only(top: 50.h, bottom: 38.h),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 430.w,
                        child: Wrap(
                          spacing: 4.w,
                          runSpacing: 16.h,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cameraTapped = true;
                                  });
                                },
                                child: CamerasWidget()),
                            CamerasWidget(),
                            CamerasWidget(),
                            CamerasWidget(),
                            CamerasWidget(),
                            CamerasWidget(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            cameraTapped
                ? Positioned(
                    top: 506.h,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(0, 0), // Shadow position
                            ),
                          ]),
                      padding: EdgeInsets.only(
                          top: 17.h, right: 23.w, left: 26.w, bottom: 26.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Камера 1, Главный вход',
                            style: AppTheme.statisticObrTextStyle,
                          ),
                          Image.asset(
                            'images/viewLarge.png',
                            width: 349.w,
                          )
                        ],
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class CamerasWidget extends StatelessWidget {
  const CamerasWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'images/view1.png',
          width: 120.w,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Камера 1',
          style: AppTheme.sendObrIdTextStyle,
        ),
        Text(
          'Главный вход',
          style: AppTheme.activityRegularTextStyle
              .copyWith(color: const Color(0xFF777777)),
        )
      ],
    );
  }
}
