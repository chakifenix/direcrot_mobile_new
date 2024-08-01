import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    'Понедельник',
                    style: AppTheme.mainAppBarTextStyle,
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 11.w, right: 11.w),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFB800),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Text(
                        'Сегодня',
                        style: AppTheme.scheduleTodayTextStyle,
                      ))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide()),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 105.w,
                              child: Text(
                                '10:10 - 10:55',
                                style: AppTheme.profileDataListTextStyle,
                              )),
                          SizedBox(
                              width: 123.w,
                              child: Text(
                                'Информатика',
                                style: AppTheme.profileInfoListTextStyle,
                              )),
                          SizedBox(
                              width: 74.w,
                              child: Text(
                                '6-”Б” кл.',
                                style: AppTheme.profileDataListTextStyle,
                              ))
                        ],
                      ),
                    ),
                  Divider(
                    height: 1.h,
                    color: Colors.black,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          );
        });
  }
}
