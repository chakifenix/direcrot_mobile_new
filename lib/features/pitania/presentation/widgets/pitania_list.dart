import 'dart:math';

import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_entity.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/pages/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PitaniaList extends StatelessWidget {
  final List<String>? listInfo;
  final List<PitaniaEntity> listNames;
  final ScrollController controller;
  PitaniaList(
      {super.key,
      this.listInfo,
      required this.listNames,
      required this.controller});

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: EdgeInsets.only(top: 19.h),
      itemCount: listNames.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          id: listNames[index].uid,
                        )));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: const BoxDecoration(border: Border(top: BorderSide())),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset('images/pit.png'),
                    Text(
                      DateFormat('dd.MM').format(listNames[index].dateTime),
                      style: TextStyle(
                        color: const Color(0xFF71727A),
                        fontSize: 10.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                    width: 239.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${listNames[index].name} ${listNames[index].surname}',
                          style: AppTheme.contingentDeatilRegularTextStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ('${context.locale}' == 'kk')
                              ? '${listNames[index].position} сынып ${'studentClass'.tr()}'
                              : ('${context.locale}' == 'ru')
                                  ? '${'studentClass'.tr()} ${listNames[index].position} класса'
                                  : '${listNames[index].position} class',
                          style: const TextStyle(
                            height: 0,
                            color: Color(0xFF71727A),
                          ),
                        )
                      ],
                    )),

                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      DateFormat('HH:mm').format(listNames[index].dateTime),
                      style: AppTheme.contingentDeatilRegularTextStyle,
                    )),
                // Text(
                //   (listNames[index].passTypeId == 1) ? 'Вход' : 'Выход',
                //   style: AppTheme.contingentDeatilRegularTextStyle,
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
