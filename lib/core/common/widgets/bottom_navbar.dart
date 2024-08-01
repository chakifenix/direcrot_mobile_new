import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 73.h,
      elevation: 0,
      padding: EdgeInsets.only(top: 0.h),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(top: 20.h),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xFFC1C1C1)))),
        child: Row(
          children: [
            navItem(
              'images/home.png',
              'main'.tr(),
              pageIndex == 0,
              onTap: () => onTap(0),
            ),
            navItem(
              'images/bell.png',
              'info'.tr(),
              pageIndex == 1,
              onTap: () => onTap(1),
            ),
            navItem(
              'images/person_icon.png',
              'contingent'.tr(),
              pageIndex == 2,
              onTap: () => onTap(2),
            ),
            navItem(
              'images/settings.png',
              'settings'.tr(),
              pageIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(String image, String title, bool selected,
      {Function()? onTap}) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 32.w,
              height: 32.h,
            ),
            Text(
              title,
              style: selected
                  ? AppTheme.bottomAppBarTextStyle.copyWith(
                      color: const Color(0xFF046BC8),
                      fontWeight: FontWeight.bold)
                  : AppTheme.bottomAppBarTextStyle,
            )
          ],
        ),
      ),
    ));
  }
}
