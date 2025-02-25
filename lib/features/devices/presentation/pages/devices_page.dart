import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/devices/presentation/bloc/device_bloc.dart';
import 'package:direcrot_mobile_new/features/devices/presentation/widgets/device_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key, required this.licenseNo, required this.expire});

  final String licenseNo;
  final String expire;

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  void initState() {
    super.initState();
    context.read<DeviceBloc>().add(DeviceListFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                          'device'.tr(),
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
                  padding: EdgeInsets.only(
                      top: 24.h, left: 37.w, right: 27.w, bottom: 13.h),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'licensePlatform'.tr(),
                        style: AppTheme.mainAppBarTextStyle,
                      ),
                      Text(
                        'status'.tr(),
                        style: AppTheme.activitySmallTextStyle,
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '№ ${widget.licenseNo}',
                            style: AppTheme.sendObrIdTextStyle,
                          ),
                          Text(
                            '${'activeUntil'.tr()} ${widget.expire}',
                            style: AppTheme.sendObrStatusTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: EdgeInsets.only(top: 17.h, left: 42.w, bottom: 19.h),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'statusSymbols'.tr(),
                        style: AppTheme.sendObrContentTextStyle
                            .copyWith(color: const Color(0xFF046BC8)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 68.w,
                            color: const Color(0xFF38AE00),
                            child: Text(
                              textAlign: TextAlign.center,
                              'works'.tr(),
                              style: AppTheme.sendObrSendedTextStyle,
                            ),
                          ),
                          SizedBox(
                            width: 33.w,
                          ),
                          Text(
                            'worksText'.tr(),
                            style: AppTheme.activityRegularTextStyle
                                .copyWith(color: const Color(0xFF777777)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 68.w,
                            color: const Color(0xFFFF7A00),
                            child: Text(
                              textAlign: TextAlign.center,
                              'works'.tr(),
                              style: AppTheme.sendObrSendedTextStyle,
                            ),
                          ),
                          SizedBox(
                            width: 33.w,
                          ),
                          Text(
                            'worksText2'.tr(),
                            style: AppTheme.activityRegularTextStyle
                                .copyWith(color: const Color(0xFF777777)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 68.w,
                            color: const Color(0xFFE22626),
                            child: Text(
                              textAlign: TextAlign.center,
                              'disabled'.tr(),
                              style: AppTheme.sendObrSendedTextStyle,
                            ),
                          ),
                          SizedBox(
                            width: 33.w,
                          ),
                          Text(
                            'notWorking'.tr(),
                            style: AppTheme.activityRegularTextStyle
                                .copyWith(color: const Color(0xFF777777)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                (state.isSuccess)
                    ? Container(
                        padding: EdgeInsets.only(
                            left: 41.w, top: 30.h, right: 27.w, bottom: 27.h),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'device'.tr(),
                                  style: AppTheme.sendObrContentTextStyle
                                      .copyWith(color: const Color(0xFF046BC8)),
                                ),
                                Text(
                                  'status2'.tr(),
                                  style: AppTheme.sendObrContentTextStyle
                                      .copyWith(color: const Color(0xFF046BC8)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            for (int i = 0; i < state.deviceList.length; i++)
                              DevicesType(
                                title: state.deviceList[i].name,
                                status: state.deviceList[i].status.toString(),
                                serialNo: state.deviceList[i].serialNo,
                              )
                          ],
                        ),
                      )
                    : const Loader()
              ],
            ),
          );
        },
      ),
    );
  }
}
