import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationMorePage extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String image;
  final String id;
  const InformationMorePage(
      {super.key,
      required this.title,
      required this.content,
      required this.date,
      required this.image,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 35.h,
            color: Colors.white,
          ),
          SizedBox(
            height: 21.h,
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
                    'info'.tr(),
                    style: AppTheme.mainMediumTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.only(
                left: 28.w, top: 24.h, bottom: 24.h, right: 24.w),
            color: Colors.white,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back)),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'news'.tr(),
                      style: AppTheme.mainAppBarTextStyle,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 82,
                        child: Text(
                          'allNews'.tr(),
                          style: AppTheme.mainAppBarSmallTextStyle,
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 41.h,
                      ),
                      Text('$date  | $id'),
                      Text(
                        title,
                        style: AppTheme.infoTitleTextStyle,
                      ),
                      (image == '')
                          ? const SizedBox()
                          : Image.network(
                              image,
                            ),
                      Text(
                        content,
                        style: AppTheme.infoRegularTextStyle,
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
