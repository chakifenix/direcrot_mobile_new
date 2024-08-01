import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  const KeyboardNumber({super.key, required this.n, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84.w,
      height: 84.h,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0xFFDDDDDD)),
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(8.w),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0.r)),
        child: Text(
          '$n',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
