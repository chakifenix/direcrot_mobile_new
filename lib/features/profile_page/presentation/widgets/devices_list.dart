import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/pass_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
              DateTime currentDate = passInfo[index].dateTime;
              DateTime? previousDate =
                  index > 0 ? passInfo[index - 1].dateTime : null;

              // Форматируем даты
              String currentFormattedDate =
                  DateFormat('dd.MM').format(currentDate);
              String? previousFormattedDate = previousDate != null
                  ? DateFormat('dd.MM').format(previousDate)
                  : null;

              // Проверяем, отличается ли текущая дата от предыдущей
              bool showDate = previousFormattedDate == null ||
                  currentFormattedDate != previousFormattedDate;
              return Column(
                children: [
                  if (showDate) ...[
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(currentFormattedDate),
                    // SizedBox(height: 5.h,)
                  ],
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide())),
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
                              child: (passInfo[index].passTypeId == 1)
                                  ? Text(
                                      'enter'.tr(),
                                      style: AppTheme.entryExitTextStyle,
                                    )
                                  : Text(
                                      'exit'.tr(),
                                      style: AppTheme.entryExitTextStyle
                                          .copyWith(color: Colors.red),
                                    ),
                            )),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
