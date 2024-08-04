import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class AppTheme {
  static _border([Color color = Colors.black]) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 3),
        borderRadius: BorderRadius.circular(10),
      );
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xFFE6E6E6),
  );
  static final displayMedium = TextStyle(fontSize: 20.sp);
  static final displayLarge = TextStyle(fontSize: 40.sp, height: 0.9);
  static final bodyMedium = TextStyle(
    fontSize: 14.sp,
    color: Colors.black,
  );
  //Auth TextStyle
  static final authLargeTextStyle = TextStyle(
      fontSize: 40.sp, fontWeight: FontWeight.w300, color: Colors.black);
  static final authMediumTextStyle =
      TextStyle(fontSize: 20.sp, height: 0, color: Colors.black);

  //main TextStyle
  static final mainMediumTextStyle =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300);
  static final mainSmallTextStyle =
      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300);
  static final mainMenuTextStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF046BC8));
  static final bottomAppBarTextStyle =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 14.sp);
  static final mainAppBarTextStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF046BC8));
  static final mainAppBarSmallTextStyle =
      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300);
  static final infoCardTextStyle =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold);
  static final infoCardRegularTextStyle = TextStyle(fontSize: 10.sp);
  static final infoRegularTextStyle = TextStyle(
    fontSize: 18.sp,
  );
  static final infoSmalTextStyle = TextStyle(
    fontSize: 12.sp,
  );
  static final infoTitleTextStyle =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold);
  static final contingentDeatilRegularTextStyle = TextStyle(fontSize: 16.sp);
  static final contingentProfileSmallTextStyle = TextStyle(
    fontSize: 10.sp,
  );
  static final activityBigTextStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF38AE00));
  static final activitySmallTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
  );
  static final activityRegularTextStyle = TextStyle(
    fontSize: 12.sp,
  );
  static final profileInfoListTextStyle =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold);
  static final profileDataListTextStyle = TextStyle(fontSize: 16.sp);
  static final scheduleTodayTextStyle =
      TextStyle(fontSize: 10.sp, color: Colors.white);
  static final entryExitTextStyle =
      TextStyle(fontSize: 16.sp, color: Color(0xFF38AE00));
  static final positionTextStyle = TextStyle(
    fontSize: 11.sp,
  );
  static final statisticObrTextStyle =
      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700);
  static final allObrTextStyle =
      TextStyle(fontSize: 10.sp, color: const Color(0xFF777777));
  static final resultObrTextStyle = TextStyle(fontSize: 32.sp);

  //ObrTextStyle
  static final sendObrIdTextStyle =
      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700);
  static final sendObrStatusTextStyle =
      TextStyle(fontSize: 10.sp, color: const Color(0xFF777777));
  static final sendObrSendedTextStyle =
      TextStyle(fontSize: 10.sp, color: Colors.white);
  static final sendObrContentTextStyle = TextStyle(fontSize: 12.sp);
  static final sendObrDateTextStyle =
      TextStyle(fontSize: 10.sp, color: const Color(0xFF046BC8));

  static final inputDecoration = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFD9D9D9),
      contentPadding: EdgeInsets.all(10.w),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.transparent)));
  static final defaultPintheme = PinTheme(
      width: 48.w,
      height: 48.h,
      textStyle: TextStyle(fontSize: 30.sp, color: Colors.black),
      decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.transparent)));
}
