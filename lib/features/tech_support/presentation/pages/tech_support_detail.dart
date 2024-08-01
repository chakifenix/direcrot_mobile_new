import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/widgets/status_otveta.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechSupportDetail extends StatelessWidget {
  const TechSupportDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      'support'.tr(),
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
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 37.w),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'requests'.tr(),
                        style: AppTheme.mainAppBarTextStyle,
                      ),
                      Text(
                        'status'.tr(),
                        style: AppTheme.activitySmallTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  left: 37.w, top: 35.h, right: 28.w, bottom: 23.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'requestNum'.tr(),
                            style: AppTheme.sendObrStatusTextStyle,
                          ),
                          Text(
                            '# 200132033',
                            style: AppTheme.sendObrIdTextStyle,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'status1'.tr(),
                            style: AppTheme.sendObrStatusTextStyle,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const StatusOtveta()
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Text(
                    '02.05.2024 18:07',
                    style: AppTheme.sendObrDateTextStyle,
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    'Мұғалімдерге сабақтардың журналын электронды түрде жүргізуге, бағалауға,  пәндердің оқу материалдары мен жоспарларын жасақтау мүмкіндігі қарастырылса деген ұсыныс бар. \n\nМұғалімдерімізге сабақтарды дұрыс жолға қою үшін мектепке келіп түсіндірме жұмыстарын жүргізсеңіздер. Көптеген мұғалімдер жаңадан келген, көбісі жастар. Осы тұстарын ескерсеңіздер. Жауап күтемін',
                    style: AppTheme.sendObrContentTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 24.h, left: 38.w, right: 28.w, bottom: 19.h),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'supportResponse'.tr(),
                    style: AppTheme.sendObrIdTextStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '03.05.2024 09:37',
                        style: AppTheme.sendObrDateTextStyle,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Менеджер: Алтынай Жорабаева',
                        style: AppTheme.sendObrStatusTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Қайырлы күн, Алтынай Сапарбайқызы. Ұсынысыңыз үшін рақмет, оқытуды жүргізу кестесіне тіркедік, уақытын қосымша хабарлаймыз. Алдағы жаңартулары кезінде мамандардың қаперіне міндетті түрде жеткіземіз.',
                    style: AppTheme.sendObrContentTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            AppButton(title: 'evaluate'.tr(), pressAction: () {}),
            SizedBox(
              height: 14.h,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 38.w, top: 14.h, right: 40.w, bottom: 17.h),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'history'.tr(),
                    style: AppTheme.sendObrIdTextStyle,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '02.05.2024 18:07',
                        style: AppTheme.sendObrContentTextStyle,
                      ),
                      const StatusOtveta(),
                      Text(
                        'requestSent'.tr(),
                        style: AppTheme.sendObrStatusTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '02.05.2024 18:07',
                        style: AppTheme.sendObrContentTextStyle,
                      ),
                      const StatusOtveta(),
                      Text(
                        'requestSent'.tr(),
                        style: AppTheme.sendObrStatusTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '02.05.2024 18:07',
                        style: AppTheme.sendObrContentTextStyle,
                      ),
                      const StatusOtveta(),
                      Text(
                        'requestSent'.tr(),
                        style: AppTheme.sendObrStatusTextStyle,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
