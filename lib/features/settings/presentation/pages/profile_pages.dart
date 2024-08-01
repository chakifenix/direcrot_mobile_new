import 'dart:io';

import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/util/show_snackbar.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/pages/login_page.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/pages/language_page.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/pages/pincode_page.dart';
import 'package:direcrot_mobile_new/init_dependencies.dart';
import 'package:direcrot_mobile_new/services/shared_preferences_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final sharedService = serviceLocator<SharedPreferencesService>();
  File? selectedImage;
  bool change = false;
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
  // TextEditingController phoneController =
  //     TextEditingController(text: '87089546959');

  // getSelectedImage() async {
  //   final selectedImagePath = await LocalStorage().readValue('imagePath');
  //   if (selectedImagePath != null) {
  //     selectedImage = File(selectedImagePath);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // getSelectedImage();
    context.read<SettingsBloc>().add(LoadProfileInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state.isProfileSuccess) {
            showSnackBar(context, state.successData ?? 'fail');
          }
        },
        builder: (context, state) {
          if (state.isSuccess) {
            if (state.imagePath != null) {
              selectedImage = File(state.imagePath!);
            }
            // if(state.)
            List<String> nameParts =
                state.fullName?.split(' ') ?? ['-', '-', '-'];
            return Column(
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
                          'settings'.tr(),
                          style: AppTheme.mainMediumTextStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 38.w, top: 23.h, bottom: 31.h, right: 38.w),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Профиль аккаунта',
                        style: AppTheme.mainAppBarTextStyle,
                      ),
                      Text(
                        'settingsSystem'.tr(),
                        style: AppTheme.mainSmallTextStyle,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              selectedImage != null
                                  ? Image.file(
                                      selectedImage!,
                                      width: 95.w,
                                      height: 95.h,
                                    )
                                  : Image.asset(
                                      'images/directorLogo.png',
                                      width: 95.w,
                                      height: 95.h,
                                    ),
                              GestureDetector(
                                onTap: () {
                                  _pickImageFromGallery();
                                },
                                child: Text(
                                  'Изменить фото',
                                  style: AppTheme.mainSmallTextStyle
                                      .copyWith(color: const Color(0xFF046BC8)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 240.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 110.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('surname'.tr()),
                                          Text('name'.tr()),
                                          Text('fatherName'.tr()),
                                          Text('iin'.tr()),
                                          Text('dateBirth'.tr()),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    SizedBox(
                                      width: 107.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(nameParts[0]),
                                          Text(nameParts[1]),
                                          Text(nameParts[2]),
                                          Text('620106400123'),
                                          Text('06.01.1962'),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 240.w,
                                child: Text(
                                  'systemData'.tr(),
                                  style: TextStyle(fontSize: 11.sp),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 95.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'email'.tr(),
                                    style: AppTheme.bottomAppBarTextStyle,
                                  ),
                                ),
                                Text(
                                  'mobile'.tr(),
                                  style: AppTheme.bottomAppBarTextStyle,
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.email ?? '',
                                style: AppTheme.bottomAppBarTextStyle,
                              ),
                              SizedBox(
                                  width: 162.w,
                                  child: TextField(
                                    controller: state.phoneController,
                                    enabled: change,
                                    focusNode: _focusNode,
                                    autofocus: true,
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.black),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero),
                                    onTapOutside: (event) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                  )),
                              // Text(
                              //   state.phoneNumber ?? '',
                              //   style: AppTheme.bottomAppBarTextStyle,
                              // )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '',
                                style: AppTheme.activitySmallTextStyle
                                    .copyWith(color: const Color(0xFF046BC8)),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              change
                                  ? GestureDetector(
                                      onTap: () {
                                        context.read<SettingsBloc>().add(
                                            UpdatePhoneNumberFetch(
                                                state.phoneController?.text ??
                                                    ''));
                                        setState(() {
                                          change = false;
                                        });
                                      },
                                      child: Text(
                                        'save'.tr(),
                                        style: AppTheme.activitySmallTextStyle
                                            .copyWith(
                                                color: const Color(0xFF046BC8)),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: changeValue,
                                      child: Text(
                                        'change'.tr(),
                                        style: AppTheme.activitySmallTextStyle
                                            .copyWith(
                                                color: const Color(0xFF046BC8)),
                                      ),
                                    )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 66.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PincodePage()));
                        },
                        child: Text(
                          'changePin'.tr(),
                          style: AppTheme.bottomAppBarTextStyle
                              .copyWith(color: const Color(0xFF046BC8)),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LanguageScreen()));
                        },
                        child: Text(
                          'changeLang'.tr(),
                          style: AppTheme.bottomAppBarTextStyle
                              .copyWith(color: const Color(0xFF046BC8)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                GestureDetector(
                  onTap: () {
                    sharedService.passed = false;
                    Navigator.of(context, rootNavigator: true)
                        .pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 36.w, top: 10.h, bottom: 19.h),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/exit.png'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'logout'.tr(),
                              style: const TextStyle(color: Color(0xFFE22626)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 15.w,
                            ),
                            SizedBox(
                              width: 325.w,
                              child: Text(
                                'logoutText'.tr(),
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          if (state.isLoading) {
            return Loader();
          }
          return Loader();
        },
      ),
    );
  }

  Future _pickImageFromGallery() async {
    context.read<SettingsBloc>().add(UploadFile());
  }

  void changeValue() {
    setState(() {
      change = true;
      _focusTextField();
    });
  }

  void _focusTextField() {
    FocusScope.of(context).requestFocus(_focusNode);
  }
}
