import 'package:direcrot_mobile_new/core/constants/constants.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/util/format_date.dart';
import 'package:direcrot_mobile_new/core/common/widgets/dropdown_button.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/bloc/profile_bloc.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/widgets/devices_list.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/widgets/profile_nagruzka_list.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/widgets/schedule_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  final int id;
  const ProfilePage({super.key, required this.id});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> items = [
    {'name': 'educational'.tr(), 'value': 3},
    {'name': 'visitUchet'.tr(), 'value': 1},
  ];

  List<Map<String, dynamic>> itemsStudent = [
    {'name': 'schedule'.tr(), 'value': 2},
    {'name': 'visitUchet'.tr(), 'value': 1},
  ];
  int selectedValue = 1;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileInfoFetch(widget.id));
    context.read<ProfileBloc>().add(PassInfoFetch(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.isSuccess) {
            print(formatDate(state.profileInfo!.lastVisit ?? ''));
            String lastVisit = (state.profileInfo?.lastVisit != null)
                ? formatDate(state.profileInfo?.lastVisit ?? '')
                : '';
            return Column(
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
                          'profile'.tr(),
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
                    left: 38.w,
                    right: 36.w,
                    top: 22.h,
                    bottom: 22.h,
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'personalInfo'.tr(),
                        style: AppTheme.mainAppBarTextStyle,
                      ),
                      Text(
                        'regisData'.tr(),
                        style: AppTheme.mainSmallTextStyle,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 58.w,
                              height: 58.h,
                              child: Image.asset(
                                  (state.profileInfo?.genderId == 3)
                                      ? Constants.profileImageGirl
                                      : Constants.profileImageMan)),
                          SizedBox(
                            width: 173.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.profileInfo?.fullName ?? '',
                                  style: AppTheme.infoRegularTextStyle,
                                ),
                                Text(
                                  state.profileInfo?.specialty ?? '',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF777777)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                                color: state.profileInfo?.online == 'true'
                                    ? Colors.green
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(4.r)),
                            child: Text(
                              state.profileInfo?.online == 'true'
                                  ? 'online'.tr()
                                  : 'ofline'.tr(),
                              style: AppTheme.contingentProfileSmallTextStyle
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 33.w, top: 16.h, bottom: 12.h),
                  color: const Color(0xFFD0FBD6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'activeSystem'.tr(),
                        style: AppTheme.activityBigTextStyle,
                      ),
                      Text(
                        'cyfrSled'.tr(),
                        style: AppTheme.activitySmallTextStyle,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 170.w,
                            child: Text(
                              'visit'.tr(),
                              style: AppTheme.activityRegularTextStyle,
                            ),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(
                            lastVisit,
                            style: AppTheme.activityRegularTextStyle
                                .copyWith(color: const Color(0xFF046BC8)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 170.w,
                            child: Text(
                              'app'.tr(),
                              style: AppTheme.activityRegularTextStyle,
                            ),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          (lastVisit == '')
                              ? Text(
                                  'noInstalled'.tr(),
                                  style: AppTheme.activityRegularTextStyle
                                      .copyWith(color: const Color(0xFFE22626)),
                                )
                              : Text(
                                  'installed'.tr(),
                                  style: AppTheme.activityRegularTextStyle
                                      .copyWith(color: const Color(0xFF38AE00)),
                                )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 38.w, top: 23.h, bottom: 23.h, right: 38.w),
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'profileData'.tr(),
                                  style: AppTheme.mainAppBarTextStyle,
                                ),
                                Text(
                                  'regisData'.tr(),
                                  style: AppTheme.mainSmallTextStyle,
                                ),
                              ],
                            ),
                            Image.asset('images/pdf_icon.png')
                          ],
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'filter'.tr(),
                              style: AppTheme.contingentDeatilRegularTextStyle,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: DropdownButtonCustom(
                                items:
                                    (state.profileInfo?.position == 'student')
                                        ? itemsStudent
                                        : items,
                                selectedValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                                hintTitle:
                                    (state.profileInfo?.position == 'student')
                                        ? itemsStudent[0]['name']
                                        : items[0]['name'],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        (state.isPassSuccess)
                            ? Expanded(
                                child: (selectedValue == 3)
                                    ? const SizedBox()
                                    // ProfileNagruzkaList()
                                    : (selectedValue == 2)
                                        ? const SizedBox()
                                        // ScheduleList()
                                        : (selectedValue == 1)
                                            ? DevicesList(
                                                passInfo: state.passInfo,
                                              )
                                            : const SizedBox())
                            : const SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return Loader();
        },
      ),
    );
  }
}
