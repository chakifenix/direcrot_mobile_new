import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/bloc/contingent_bloc.dart';
import 'package:direcrot_mobile_new/features/contingent_student/presentation/bloc/contingent_student_bloc.dart';
import 'package:direcrot_mobile_new/features/devices/presentation/bloc/device_bloc.dart';
import 'package:direcrot_mobile_new/features/lgotniki/presentation/bloc/lgotniki_bloc.dart';
import 'package:direcrot_mobile_new/features/pitania/presentation/bloc/pitania_bloc.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/bloc/profile_bloc.dart';
import 'package:direcrot_mobile_new/features/information/presentation/bloc/news_bloc.dart';
import 'package:direcrot_mobile_new/features/main/presentation/bloc/main_bloc.dart';
import 'package:direcrot_mobile_new/features/onboard/presentation/pages/splash_screen.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:direcrot_mobile_new/features/skud/presentation/bloc/skud_bloc.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/bloc/support_bloc.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/pages/individual_chat_screen.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/pages/tech_support.dart';
import 'package:direcrot_mobile_new/init_dependencies.dart';
import 'package:direcrot_mobile_new/services/shared_preferences_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
      BlocProvider(create: (context) => serviceLocator<MainBloc>()),
      BlocProvider(create: (context) => serviceLocator<ContingentBloc>()),
      BlocProvider(create: (context) => serviceLocator<NewsBloc>()),
      BlocProvider(
          create: (context) => serviceLocator<ContingentStudentBloc>()),
      BlocProvider(create: (context) => serviceLocator<ProfileBloc>()),
      BlocProvider(create: (context) => serviceLocator<SettingsBloc>()),
      BlocProvider(create: (context) => serviceLocator<SkudBloc>()),
      BlocProvider(create: (context) => serviceLocator<PitaniaBloc>()),
      BlocProvider(create: (context) => serviceLocator<LgotnikiBloc>()),
      BlocProvider(create: (context) => serviceLocator<DeviceBloc>()),
      BlocProvider(create: (context) => serviceLocator<SupportBloc>())
    ],
    child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
          Locale('kk'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  final sharedService = serviceLocator<SharedPreferencesService>();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.lightThemeMode.copyWith(
              textTheme: TextTheme(
                  bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.black)),
            ),
            home:
                // IndividualScreen(
                //   receiverEmail: 'asd',
                //   receiverID: '2',
                //   fullName: 'daasdasd',
                // ),
                // SplashScreen(),
                TechSupport(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        });
  }
}
