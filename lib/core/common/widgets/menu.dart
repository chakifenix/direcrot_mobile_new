import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/cameras/presentation/pages/cameras_page.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/pages/contingent_page.dart';
import 'package:direcrot_mobile_new/features/devices/presentation/pages/devices_page.dart';
import 'package:direcrot_mobile_new/features/pitania/presentation/pages/pitania_page.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/pages/language_page.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/pages/pincode_page.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/pages/profile_pages.dart';
import 'package:direcrot_mobile_new/features/skud/presentation/pages/skud_page.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/pages/tech_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Menu extends StatelessWidget {
  final String title;
  final int id;
  final String image;
  final Color? color;
  const Menu(
      {super.key,
      required this.title,
      required this.image,
      this.color,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        (color == const Color(0xFF777777))
            ? null
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (id == 13)
                        ? DevicesPage()
                        : (id == 12)
                            ? TechSupport()
                            : (id == 2)
                                ? SkudPage(
                                    positionName: 'positionName',
                                    allCount: '12',
                                    manCount: '12',
                                    womanCount: '12',
                                    title: title)
                                : (id == 5)
                                    ? const CamerasPage()
                                    : (id == 14)
                                        ? ProfilePage()
                                        : (id == 16)
                                            ? const LanguageScreen()
                                            : (id == 17)
                                                ? const PincodePage()
                                                : (id == 1)
                                                    ? ContingentPage(
                                                        title: title)
                                                    : (id == 3)
                                                        ? const PitaniaPage()
                                                        : Container(
                                                            width: 100,
                                                            height: 400,
                                                            color: Colors.red,
                                                          )));
      },
      child: SizedBox(
        width: 91.w,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 40.w,
              height: 40.h,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: (color == null)
                    ? AppTheme.mainMenuTextStyle
                    : AppTheme.mainMenuTextStyle
                        .copyWith(color: color, fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
