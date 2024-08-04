part of 'main_bloc.dart';

enum MainStatus { initial, loading, success, failure }

enum LicenseStatus { initial, loading, success, failure }

class MainState extends Equatable {
  final MainStatus status;
  final LicenseStatus licenseStatus;
  final String? error;
  final TodayStats? todayStats;
  final String? name;
  final String? schoolName;
  final String? profileImage;
  final String? genderId;
  final LicenseEntity? license;

  const MainState(
      {this.status = MainStatus.initial,
      this.licenseStatus = LicenseStatus.initial,
      this.error,
      this.todayStats,
      this.name,
      this.schoolName,
      this.profileImage,
      this.genderId,
      this.license});

  @override
  List<Object?> get props => [
        status,
        licenseStatus,
        error,
        todayStats,
        name,
        schoolName,
        profileImage,
        genderId,
        license
      ];

  bool get isInitial => status == MainStatus.initial;
  bool get isLoading => status == MainStatus.loading;
  bool get isSuccess => status == MainStatus.success;
  bool get isFailure => status == MainStatus.failure;

  bool get isLicenseInitial => licenseStatus == LicenseStatus.initial;
  bool get isLicenseLoading => licenseStatus == LicenseStatus.loading;
  bool get isLicenseSuccess => licenseStatus == LicenseStatus.success;
  bool get isLicenseFailure => licenseStatus == LicenseStatus.failure;

  MainState copyWith(
      {MainStatus? status,
      LicenseStatus? licenseStatus,
      String? error,
      TodayStats? todayStats,
      String? name,
      String? schoolName,
      String? profileImage,
      String? genderId,
      LicenseEntity? license}) {
    return MainState(
        status: status ?? this.status,
        licenseStatus: licenseStatus ?? this.licenseStatus,
        todayStats: todayStats ?? this.todayStats,
        error: error ?? this.error,
        name: name ?? this.name,
        schoolName: schoolName ?? this.schoolName,
        profileImage: profileImage ?? this.profileImage,
        genderId: genderId ?? this.genderId,
        license: license ?? this.license);
  }
}
