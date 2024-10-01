import 'package:direcrot_mobile_new/core/common/widgets/button.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/bloc/support_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvaluateWidget extends StatefulWidget {
  final String path;
  const EvaluateWidget({super.key, required this.path});

  @override
  State<EvaluateWidget> createState() => _EvaluateWidgetState();
}

class _EvaluateWidgetState extends State<EvaluateWidget> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.h),
      height: 400.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            'evaluateService'.tr(),
            style: TextStyle(fontSize: 20.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = 1;
                  });
                },
                child: SizedBox(
                    width: 58.w,
                    height: 58.h,
                    child: Image.asset(
                      (value >= 1)
                          ? 'images/starFilled.png'
                          : 'images/star.png',
                      color: Colors.amber,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = 2;
                  });
                },
                child: SizedBox(
                    width: 58.w,
                    height: 58.h,
                    child: Image.asset(
                      (value >= 2)
                          ? 'images/starFilled.png'
                          : 'images/star.png',
                      color: Colors.amber,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = 3;
                  });
                },
                child: SizedBox(
                    width: 58.w,
                    height: 58.h,
                    child: Image.asset(
                      (value >= 3)
                          ? 'images/starFilled.png'
                          : 'images/star.png',
                      color: Colors.amber,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = 4;
                  });
                },
                child: SizedBox(
                    width: 58.w,
                    height: 58.h,
                    child: Image.asset(
                      (value >= 4)
                          ? 'images/starFilled.png'
                          : 'images/star.png',
                      color: Colors.amber,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = 5;
                  });
                },
                child: SizedBox(
                    width: 58.w,
                    height: 58.h,
                    child: Image.asset(
                      (value >= 5)
                          ? 'images/starFilled.png'
                          : 'images/star.png',
                      color: Colors.amber,
                    )),
              ),
            ],
          ),
          AppButton(
              title: 'evaluate'.tr(),
              pressAction: () {
                context
                    .read<SupportBloc>()
                    .add(EvaluateTicketFetch('$value', widget.path));
                context.read<SupportBloc>().add(CloseTicketFetch(widget.path));
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
