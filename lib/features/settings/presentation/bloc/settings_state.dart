part of 'settings_bloc.dart';

enum SettingsStatus { initial, loading, success, failure }

enum ProfileStatus { initial, loading, success, failure }

class SettingsState extends Equatable {
  final SettingsStatus status;
  final ProfileStatus profileStatus;
  final String? fullName;
  final String? schoolName;
  final String? email;
  final String? phoneNumber;
  final String? imagePath;
  final String? genderId;
  final String? iin;
  final String? birthDay;
  final TextEditingController? phoneController;
  final String? successData;
  final LicenseEntity? license;
  final String? error;

  const SettingsState(
      {this.status = SettingsStatus.initial,
      this.profileStatus = ProfileStatus.initial,
      this.fullName,
      this.schoolName,
      this.email,
      this.phoneNumber,
      this.imagePath,
      this.genderId,
      this.iin,
      this.birthDay,
      this.phoneController,
      this.successData,
      this.license,
      this.error});

  @override
  List<Object?> get props => [
        status,
        profileStatus,
        fullName,
        schoolName,
        email,
        phoneNumber,
        imagePath,
        genderId,
        iin,
        birthDay,
        phoneController,
        successData,
        license,
        error
      ];

  bool get isInitial => status == SettingsStatus.initial;
  bool get isLoading => status == SettingsStatus.loading;
  bool get isSuccess => status == SettingsStatus.success;
  bool get isFailure => status == SettingsStatus.failure;

  bool get isProfileInitial => profileStatus == ProfileStatus.initial;
  bool get isProfileLoading => profileStatus == ProfileStatus.loading;
  bool get isProfileSuccess => profileStatus == ProfileStatus.success;
  bool get isProfileFailure => profileStatus == ProfileStatus.failure;

  SettingsState copyWith(
      {SettingsStatus? status,
      ProfileStatus? profileStatus,
      String? fullName,
      String? schoolName,
      String? email,
      String? phoneNumber,
      String? imagePath,
      String? birthDay,
      String? iin,
      String? genderId,
      TextEditingController? phoneController,
      String? successData,
      LicenseEntity? license,
      String? error}) {
    return SettingsState(
        status: status ?? this.status,
        profileStatus: profileStatus ?? this.profileStatus,
        fullName: fullName ?? this.fullName,
        schoolName: schoolName ?? this.schoolName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        imagePath: imagePath ?? this.imagePath,
        genderId: genderId ?? this.genderId,
        iin: iin ?? this.iin,
        birthDay: birthDay ?? this.birthDay,
        phoneController: phoneController ?? this.phoneController,
        successData: successData ?? this.successData,
        license: license ?? this.license,
        error: error ?? this.error);
  }
}
