import 'package:direcrot_mobile_new/features/auth/data/data_source/auth_api_service.dart';
import 'package:direcrot_mobile_new/features/auth/data/repository/auth_repository_impl.dart';
import 'package:direcrot_mobile_new/features/auth/domain/repository/auth_repository.dart';
import 'package:direcrot_mobile_new/features/auth/domain/usecases/save_phone.dart';
import 'package:direcrot_mobile_new/features/auth/domain/usecases/user_iin_login.dart';
import 'package:direcrot_mobile_new/features/auth/domain/usecases/user_sms_login.dart';
import 'package:direcrot_mobile_new/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:direcrot_mobile_new/features/contingent/data/datasource/contingent_data_source.dart';
import 'package:direcrot_mobile_new/features/contingent/data/repositories/contingent_repository_impl.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/repositories/contingent_repository.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/usecases/get_contingent_data.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/usecases/get_contingent_personnel_data.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/usecases/get_contingent_teacher_data.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/usecases/get_contingent_teacher_gender.dart';
import 'package:direcrot_mobile_new/features/contingent/presentation/bloc/contingent_bloc.dart';
import 'package:direcrot_mobile_new/features/contingent_student/data/data_source/contingent_student_data_source.dart';
import 'package:direcrot_mobile_new/features/contingent_student/data/repositories/contingent_student_repository_impl.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/repositories/contingent_student_repository.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/usecases/get_contingent_student_data.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/usecases/get_contingent_student_gender_data.dart';
import 'package:direcrot_mobile_new/features/contingent_student/presentation/bloc/contingent_student_bloc.dart';
import 'package:direcrot_mobile_new/features/devices/data/data_source/device_data_source.dart';
import 'package:direcrot_mobile_new/features/devices/data/repository/devices_repository_impl.dart';
import 'package:direcrot_mobile_new/features/devices/domain/repository/devices_repository.dart';
import 'package:direcrot_mobile_new/features/devices/domain/usecases/get_devices_list.dart';
import 'package:direcrot_mobile_new/features/devices/presentation/bloc/device_bloc.dart';
import 'package:direcrot_mobile_new/features/information/data/data_source/news_data_source.dart';
import 'package:direcrot_mobile_new/features/information/data/repository/news_repository_impl.dart';
import 'package:direcrot_mobile_new/features/information/domain/repository/news_repository.dart';
import 'package:direcrot_mobile_new/features/information/domain/usecase/get_news_article.dart';
import 'package:direcrot_mobile_new/features/information/presentation/bloc/news_bloc.dart';
import 'package:direcrot_mobile_new/features/lgotniki/data/data_source/lgotniki_data_source.dart';
import 'package:direcrot_mobile_new/features/lgotniki/data/repository/lgotniki_repository_impl.dart';
import 'package:direcrot_mobile_new/features/lgotniki/domain/repostory/lgotniki_repository.dart';
import 'package:direcrot_mobile_new/features/lgotniki/domain/usecase/get_lgotniki_data.dart';
import 'package:direcrot_mobile_new/features/lgotniki/domain/usecase/get_lgotniki_gender.dart';
import 'package:direcrot_mobile_new/features/lgotniki/presentation/bloc/lgotniki_bloc.dart';
import 'package:direcrot_mobile_new/features/main/data/datasources/main_data_source.dart';
import 'package:direcrot_mobile_new/features/main/data/repositories/main_repository_impl.dart';
import 'package:direcrot_mobile_new/features/main/domain/repositories/main_repository.dart';
import 'package:direcrot_mobile_new/features/main/domain/usecases/get_license.dart';
import 'package:direcrot_mobile_new/features/main/domain/usecases/get_today_stats.dart';
import 'package:direcrot_mobile_new/features/main/presentation/bloc/main_bloc.dart';
import 'package:direcrot_mobile_new/features/pitania/data/data_source/pitania_data_source.dart';
import 'package:direcrot_mobile_new/features/pitania/data/repository/pitania_repository_impl.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/repository/pitania_repository.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/usecase/get_all_pitania_list.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/usecase/get_pitania_count.dart';
import 'package:direcrot_mobile_new/features/pitania/presentation/bloc/pitania_bloc.dart';
import 'package:direcrot_mobile_new/features/profile_page/data/data_source/profile_data_source.dart';
import 'package:direcrot_mobile_new/features/profile_page/data/repository/profile_repository_impl.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/repository/profile_repository.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/usecases/get_pass_info.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/usecases/get_profile_info.dart';
import 'package:direcrot_mobile_new/features/profile_page/presentation/bloc/profile_bloc.dart';
import 'package:direcrot_mobile_new/features/settings/data/data_source/settings_data_source.dart';
import 'package:direcrot_mobile_new/features/settings/data/repository/settings_repository_impl.dart';
import 'package:direcrot_mobile_new/features/settings/domain/repository/settings_repository.dart';
import 'package:direcrot_mobile_new/features/settings/domain/usecase/get_license_data.dart';
import 'package:direcrot_mobile_new/features/settings/domain/usecase/update_phone_number.dart';
import 'package:direcrot_mobile_new/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:direcrot_mobile_new/features/skud/data/data_source/skud_data_source.dart';
import 'package:direcrot_mobile_new/features/skud/data/repository/skud_repository_impl.dart';
import 'package:direcrot_mobile_new/features/skud/domain/repository/skud_repository.dart';
import 'package:direcrot_mobile_new/features/skud/domain/usecases/get_skud_list.dart';
import 'package:direcrot_mobile_new/features/skud/presentation/bloc/skud_bloc.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/data_source/support_data_source.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/repository/support_repository_impl.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/get_ticket_list.dart';
import 'package:direcrot_mobile_new/features/tech_support/presentation/bloc/support_bloc.dart';
import 'package:direcrot_mobile_new/services/local_storage.dart';
import 'package:direcrot_mobile_new/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final sharedPreferencesService = await SharedPreferencesService.getInstance();
  serviceLocator.registerSingleton(sharedPreferencesService);

  final localStorage = LocalStorage();
  serviceLocator.registerSingleton(localStorage);
  initAuth();
  initMainPage();
  initContingentPage();
  initNewsPage();
  initContingentStudent();
  initProfileInfo();
  initSettings();
  initSkud();
  initPitania();
  initLgotniki();
  initDeviceList();
  initSupport();
}

void initAuth() {
  // DataSource
  serviceLocator
    ..registerFactory<AuthApiService>(() => AuthApiServiceImpl())
    //Repository
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => UserIinLogin(serviceLocator()))
    ..registerFactory(() => UserSmsLogin(serviceLocator()))
    ..registerFactory(() => SavePhoneNumber(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => AuthBloc(
        userIinLogin: serviceLocator(),
        userSmsLogin: serviceLocator(),
        savePhone: serviceLocator()));
}

void initMainPage() {
  //DataSource
  serviceLocator
    ..registerFactory<MainDataSource>(() => MainDataSourceImpl())
    //Repository
    ..registerFactory<MainRepository>(
        () => MainRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => GetTodayStats(serviceLocator()))
    ..registerFactory(() => GetLicense(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => MainBloc(
        getTodayStats: serviceLocator(), getLicenseData: serviceLocator()));
}

void initContingentPage() {
  //DataSource
  serviceLocator
    ..registerFactory<ContingentDataSource>(() => ContingentDataSourceImpl())
    //Repository
    ..registerFactory<ContingentRepository>(
        () => ContingentRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => GetContingentData(serviceLocator()))
    ..registerFactory(() => GetContingentTeacherData(serviceLocator()))
    ..registerFactory(() => GetContingentTeacherGender(serviceLocator()))
    ..registerFactory(() => GetContingentPersonnelData(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => ContingentBloc(
        getContingentData: serviceLocator(),
        getContingentTeacherData: serviceLocator(),
        getContingentTeacherGender: serviceLocator(),
        getContingentPersonnelData: serviceLocator()));
}

void initNewsPage() {
  //DataSource
  serviceLocator
    ..registerFactory<NewsDataSource>(() => NewsDataSourceImpl())
    //Repository
    ..registerFactory<NewsRepository>(
        () => NewsRepositoryImpl(newsDataSource: serviceLocator()))
    //UseCase
    ..registerFactory(() => GetNewsArticle(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => NewsBloc(getNewsArticle: serviceLocator()));
}

void initContingentStudent() {
  //DataSource
  serviceLocator
    ..registerFactory<ContingentStudentDataSource>(
        () => ContingentStudentDataSourceImpl())
    //Repository
    ..registerFactory<ContingentStudentRepository>(
        () => ContingentStudentRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => GetContingentStudentData(serviceLocator()))
    ..registerFactory(() => GetContingentStudentGenderData(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => ContingentStudentBloc(
        getContingentStudentData: serviceLocator(),
        getContingentStudentGenderData: serviceLocator()));
}

void initProfileInfo() {
  //DataSource
  serviceLocator
    ..registerFactory<ProfileDataSource>(() => ProfileDataSourceImpl())
    //Repository
    ..registerFactory<ProfileRepository>(
        () => ProfileRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => GetProfileInfo(serviceLocator()))
    ..registerFactory(() => GetPassInfo(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => ProfileBloc(
        getProfileInfo: serviceLocator(), getPassInfo: serviceLocator()));
}

void initSettings() {
  //DataSource
  serviceLocator
    ..registerFactory<SettingsDataSource>(() => SettingsDataSourceImpl())
    //Repository
    ..registerFactory<SettingsRepository>(
        () => SettingsRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => UpdatePhoneNumber(serviceLocator()))
    ..registerFactory(() => GetLicenseData(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => SettingsBloc(
        updatePhoneNumber: serviceLocator(), getLicenseData: serviceLocator()));
}

void initSkud() {
  //DataSource
  serviceLocator
    ..registerFactory<SkudDataSource>(() => SkudDataSourceImpl())
    //Repository
    ..registerFactory<SkudRepository>(
        () => SkudRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => GetSkudList(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => SkudBloc(getSkudList: serviceLocator()));
}

void initPitania() {
  //DataSource
  serviceLocator
    ..registerFactory<PitaniaDataSource>(() => PitaniaDataSourceImpl())
    //Repository
    ..registerFactory<PitaniaRepository>(
        () => PitaniaRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => GetAllPitaniaList(serviceLocator()))
    ..registerFactory(() => GetPitaniaCount(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => PitaniaBloc(
        getAllPitaniaList: serviceLocator(),
        getPitaniaCount: serviceLocator()));
}

void initLgotniki() {
  //DataSource
  serviceLocator
    ..registerFactory<LgotnikiDataSource>(() => LgotnikiDataSourceImpl())
    //Repository
    ..registerFactory<LgotnikiRepository>(
        () => LgotnikiRepositoryImpl(serviceLocator()))
    //UseCase
    ..registerFactory(() => GetLgotnikiData(serviceLocator()))
    ..registerFactory(() => GetLgotnikiGender(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => LgotnikiBloc(
        getLgotnikiData: serviceLocator(),
        getLgotnikiGender: serviceLocator()));
}

void initDeviceList() {
  //DataSource
  serviceLocator
    ..registerFactory<DeviceDataSource>(() => DeviceDataSourceImpl())
    //Repository
    ..registerFactory<DevicesRepository>(
        () => DevicesRepositoryImpl(serviceLocator()))
    //Usecase
    ..registerFactory(() => GetDevicesList(serviceLocator()))
    //Bloc
    ..registerLazySingleton(() => DeviceBloc(getDevicesList: serviceLocator()));
}

void initSupport() {
  //DataSource
  serviceLocator
    ..registerFactory<SupportDataSource>(() => SupportDataSourceImpl())
    //Repository
    ..registerFactory<SupportRepository>(
        () => SupportRepositoryImpl(serviceLocator()))
    //Usecase
    ..registerFactory(() => GetTicketList(serviceLocator()))
    //Bloc
    ..registerFactory(() => SupportBloc(getTicketList: serviceLocator()));
}
