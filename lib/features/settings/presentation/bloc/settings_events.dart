part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadUserInfo extends SettingsEvent {}

class LoadProfileInfo extends SettingsEvent {}

class UploadFile extends SettingsEvent {}

class UpdatePhoneNumberFetch extends SettingsEvent {
  final String phoneNumber;
  const UpdatePhoneNumberFetch(this.phoneNumber);
}

class LicenseDataFetch extends SettingsEvent {}
