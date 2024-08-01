import 'dart:math';

import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/pages/profile_page.dart';
import 'package:direcrot_mobile_new/features/skud/domain/entities/skud_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkudList extends StatelessWidget {
  final List<String>? listInfo;
  final List<SkudEntity> listNames;
  final ScrollController controller;
  SkudList(
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
                SizedBox(
                    width: 61.w,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          DateFormat('HH:mm:ss')
                              .format(listNames[index].dateTime),
                          style: AppTheme.contingentDeatilRegularTextStyle,
                        ))),
                SizedBox(
                  width: 15.w,
                ),
                SizedBox(
                    width: 172.w,
                    child: Text(
                      '${listNames[index].name} ${listNames[index].surname}',
                      style: AppTheme.contingentDeatilRegularTextStyle
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: 46.w,
                ),
                Text(
                  (listNames[index].passTypeId == 1) ? 'Вход' : 'Выход',
                  style: AppTheme.contingentDeatilRegularTextStyle,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
