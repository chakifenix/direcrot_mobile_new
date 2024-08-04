import 'dart:math';

import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/pages/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContingentList extends StatelessWidget {
  final List<String>? listInfo;
  final List listNames;
  final ScrollController controller;
  ContingentList(
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
                          id: listNames[index].id,
                        )));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: const BoxDecoration(border: Border(top: BorderSide())),
            child: Row(
              children: [
                SizedBox(
                    width: 15.w,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${index + 1}.',
                          style: AppTheme.contingentDeatilRegularTextStyle,
                        ))),
                SizedBox(
                  width: 8.w,
                ),
                SizedBox(
                    width: 172.w,
                    child: Text(
                      listNames[index].fullName,
                      style: AppTheme.contingentDeatilRegularTextStyle
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: 46.w,
                ),
                Text(
                  '${listNames[index].classNumber} ${'class'.tr()}',
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
