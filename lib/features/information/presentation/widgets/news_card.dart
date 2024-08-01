import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/information/presentation/pages/infotmation_more_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String image;
  final String id;
  const NewsCard(
      {super.key,
      required this.title,
      required this.content,
      required this.date,
      required this.image,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => InformationMorePage()));
        Navigator.of(context, rootNavigator: false).push(
          MaterialPageRoute(
              builder: (context) => InformationMorePage(
                  title: title,
                  content: content,
                  date: date,
                  image: image,
                  id: id)),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 38.w, right: 24.w, top: 10.h, bottom: 10.h),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (image == '')
                    ? SizedBox(
                        width: 95.w,
                        height: 96.h,
                      )
                    : Image.network(
                        image,
                        width: 95.w,
                        height: 96.h,
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$date  | $id',
                      style: AppTheme.infoCardRegularTextStyle,
                    ),
                    SizedBox(
                      width: 260.w,
                      child: Text(
                        title,
                        style: AppTheme.infoCardTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: 260.w,
                      child: Text(
                        maxLines: 4,
                        content,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.infoCardRegularTextStyle,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
