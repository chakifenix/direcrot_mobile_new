import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileNagruzkaList extends StatelessWidget {
  const ProfileNagruzkaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 29.w,
                child: Text(
                  'Кл.',
                  style: AppTheme.profileInfoListTextStyle,
                )),
            SizedBox(
                width: 113.w,
                child: Text(
                  'Предмет',
                  style: AppTheme.profileInfoListTextStyle,
                )),
            SizedBox(
                width: 32.w,
                child: Text(
                  'Час',
                  style: AppTheme.profileInfoListTextStyle,
                )),
            SizedBox(
                width: 42.w,
                child: Text(
                  'Вып.',
                  style: AppTheme.profileInfoListTextStyle,
                )),
            SizedBox(
                width: 39.w,
                child: Text(
                  '%',
                  style: AppTheme.profileInfoListTextStyle,
                ))
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0.h),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration:
                    const BoxDecoration(border: Border(bottom: BorderSide())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 29.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '6-А',
                            style: AppTheme.profileDataListTextStyle,
                          ),
                        )),
                    SizedBox(
                        width: 113.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            textAlign: TextAlign.start,
                            'Информатика',
                            style: AppTheme.profileInfoListTextStyle,
                          ),
                        )),
                    SizedBox(
                        width: 32.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '68',
                            style: AppTheme.profileDataListTextStyle,
                          ),
                        )),
                    SizedBox(
                        width: 42.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '60',
                            style: AppTheme.profileDataListTextStyle,
                          ),
                        )),
                    SizedBox(
                        width: 39.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '88,2',
                            style: AppTheme.profileDataListTextStyle,
                          ),
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
