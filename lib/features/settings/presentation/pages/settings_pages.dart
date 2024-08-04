import 'dart:io';

import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/core/common/widgets/menu.dart';
import 'package:direcrot_mobile_new/features/devices/presentation/pages/devices_page.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/pages/profile_pages.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/pages/tech_support.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(LoadUserInfo());
    context.read<SettingsBloc>().add(LicenseDataFetch());
  }

  Future<void> _refresh() async {
    Future timeout = Future.delayed(const Duration(seconds: 3));
    Future bloc = context.read<SettingsBloc>().stream.first;
    context.read<SettingsBloc>().add(LoadUserInfo());
    await Future.any([bloc, timeout]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state.isSuccess) {
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
                          left: 34.w, top: 12.h, bottom: 12.h, right: 24.w),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: (state.imagePath != null)
                                  ? ClipOval(
                                      child: Image.file(
                                        File(state.imagePath!),
                                        width: 58.w,
                                        height: 58.h,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Image.asset(
                                      'images/directorLogo.png',
                                      width: 58.w,
                                    )),
                          SizedBox(
                            width: 18.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 215.w,
                                child: Text(
                                  state.fullName ?? '',
                                  style: AppTheme.profileInfoListTextStyle,
                                ),
                              ),
                              SizedBox(
                                  width: 215.w,
                                  child: Text(
                                    'director'.tr(),
                                    style: AppTheme.positionTextStyle,
                                  ))
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: Text(
                              'profile'.tr(),
                              style: AppTheme.mainAppBarTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          color: const Color(0xFFFFB800),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Мангистауская область, город Актау',
                                    style: AppTheme
                                        .contingentProfileSmallTextStyle,
                                  ),
                                  Text(
                                    state.schoolName ?? '',
                                    style: AppTheme.infoCardTextStyle,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 48.w,
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: CustomPaint(
                                size: Size(27.w, 14.h),
                                painter: TrianglePainter(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 33.w, top: 21.h, bottom: 21.h, right: 20.w),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('orgDetail'.tr()),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  downloadAndOpenFile(
                                      'https://axiomabio.com/pdf/test.pdf',
                                      'sample.pdf');
                                },
                                child: Text(
                                  'download'.tr(),
                                  style: AppTheme.infoSmalTextStyle
                                      .copyWith(color: const Color(0xFF046BC8)),
                                ),
                              ),
                              SizedBox(
                                width: 17.w,
                              ),
                              Text(
                                'share'.tr(),
                                style: AppTheme.infoSmalTextStyle
                                    .copyWith(color: const Color(0xFF046BC8)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 23.h, left: 36.w, right: 21.w, bottom: 17.h),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'licensePlatform'.tr(),
                                style: AppTheme.mainAppBarTextStyle,
                              ),
                              Image.asset('images/pdf_icon.png')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 177.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('license2'.tr()),
                                    Text('date'.tr()),
                                    Text('validity'.tr()),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 154.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.license?.license ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      (state.license?.dateCreated != null)
                                          ? DateFormat('dd.MM.yyyy').format(
                                              state.license!.dateCreated)
                                          : '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      (state.license?.dateExpire != null)
                                          ? DateFormat('dd.MM.yyyy')
                                              .format(state.license!.dateExpire)
                                          : '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'expire'.tr(),
                            style: AppTheme.contingentProfileSmallTextStyle
                                .copyWith(color: const Color(0xFFFF7A00)),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TechSupport()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFC1C1C1)),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                    'supportContact'.tr(),
                                    style: AppTheme.infoSmalTextStyle,
                                  ),
                                ),
                                Text(
                                  'support.edus.kz',
                                  style: AppTheme.infoSmalTextStyle
                                      .copyWith(color: const Color(0xFF046BC8)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DevicesPage(
                                      licenseNo: state.license?.license ?? '',
                                      expire: DateFormat('dd.MM.yyyy').format(
                                          state.license?.dateExpire ??
                                              DateTime.now()),
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 80.w),
                        color: const Color(0xFF008DD6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('images/card_img.png'),
                            Text(
                              'installedDevice'.tr(),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: 36.w, top: 28.h, right: 23.w, bottom: 28.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'settingsApp'.tr(),
                            style: AppTheme.mainAppBarTextStyle,
                          ),
                          Text(
                            'settingsSystem'.tr(),
                            style: AppTheme.activitySmallTextStyle,
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: [
                                  Menu(
                                    title: 'profile'.tr(),
                                    image: 'images/person.png',
                                    color: Colors.black,
                                    id: 14,
                                  ),
                                  Menu(
                                    title: 'notif'.tr(),
                                    image: 'images/comment_menu.png',
                                    color: Colors.black,
                                    id: 15,
                                  ),
                                  Menu(
                                    title: 'language'.tr(),
                                    image: 'images/global.png',
                                    color: Colors.black,
                                    id: 16,
                                  ),
                                  Menu(
                                    title: 'pinCode'.tr(),
                                    image: 'images/pincode.png',
                                    color: Colors.black,
                                    id: 17,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
              if (state.isLoading) {
                return Column(
                  children: [
                    SizedBox(
                      height: 500.h,
                    ),
                    const Loader()
                  ],
                );
              }
              return const Loader();
            },
          ),
        ),
      ),
    );
  }

  Future<void> downloadAndOpenFile(String url, String fileName) async {
    try {
      // Получаем временную директорию
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // Путь для сохранения файла
      String filePath = '$tempPath/$fileName';

      // Инициализируем Dio
      Dio dio = Dio();

      // Скачиваем файл и сохраняем его в filePath
      await dio.download(url, filePath);

      // Открываем файл
      OpenFile.open(filePath);
    } catch (e) {
      print('Error downloading or opening file: $e');
    }
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white // Set the color of the triangle
      ..style = PaintingStyle.fill; // Fill the triangle

    Path path = Path();
    path.moveTo(size.width / 2, 0); // Top center
    path.lineTo(size.width, size.height); // Bottom right
    path.lineTo(0, size.height); // Bottom left
    path.close(); // Close the path to form the triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
