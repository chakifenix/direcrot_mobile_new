import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OkuProcessCard extends StatelessWidget {
  OkuProcessCard({super.key, required this.schedule, required this.day});

  final Map schedule;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF71727A)),
        ),
        for (int k = 0; k < schedule.length; k++)
          Column(
            children: [
              Text('${k + 1} смена'),
              SizedBox(
                height: 13.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(10.r)),
                padding: EdgeInsets.all(15.w),
                child: Row(
                  children: [
                    Text('№'),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text('Уақыт'),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text('schedule'.tr())
                  ],
                ),
              ),
              for (int j = 0;
                  j < schedule['${schedule.keys.elementAt(k)}'].length;
                  j++)
                Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFCCCDCD))),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20.w, child: Text('${j + 1}')),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          Text(schedule['${schedule.keys.elementAt(k)}'][
                                  schedule['${schedule.keys.elementAt(k)}']
                                      .keys
                                      .elementAt(j)]['mek_smena']
                              .split(" - ")[0]),
                          Text(schedule['${schedule.keys.elementAt(k)}'][
                                  schedule['${schedule.keys.elementAt(k)}']
                                      .keys
                                      .elementAt(j)]['mek_smena']
                              .split(" - ")[1])
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                          width: 199.w,
                          child: Text(schedule['${schedule.keys.elementAt(k)}'][
                              schedule['${schedule.keys.elementAt(k)}']
                                  .keys
                                  .elementAt(j)]['predmet_kaz']))
                    ],
                  ),
                ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
      ],
    );
  }
}
