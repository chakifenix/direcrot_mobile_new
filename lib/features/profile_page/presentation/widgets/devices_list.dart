import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/pass_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({super.key, required this.passInfo});
  final List<PassEntity> passInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 72.w,
                child: Text(
                  'today2'.tr(),
                  style: AppTheme.profileInfoListTextStyle,
                )),
            SizedBox(
                width: 120.w,
                child: Text(
                  'device'.tr(),
                  style: AppTheme.profileInfoListTextStyle,
                )),
            SizedBox(
                width: 90.w,
                child: Text(
                  'passInfo'.tr(),
                  style: AppTheme.profileInfoListTextStyle,
                )),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0.h),
            itemCount: passInfo.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration:
                    const BoxDecoration(border: Border(bottom: BorderSide())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 72.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            DateFormat('HH:mm')
                                .format(passInfo[index].dateTime),
                            style: AppTheme.profileDataListTextStyle,
                          ),
                        )),
                    SizedBox(
                        width: 120.w,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            textAlign: TextAlign.start,
                            'Турникет 2',
                            style: AppTheme.profileInfoListTextStyle,
                          ),
                        )),
                    SizedBox(
                        width: 90.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            (passInfo[index].passTypeId == 1)
                                ? 'enter'.tr()
                                : 'exit'.tr(),
                            style: AppTheme.entryExitTextStyle,
                          ),
                        )),
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
