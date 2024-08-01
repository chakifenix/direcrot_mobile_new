import 'dart:io';

import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';
import 'package:direcrot_mobile_new/features/settings/domain/usecase/get_license_data.dart';
import 'package:direcrot_mobile_new/features/settings/domain/usecase/update_phone_number.dart';
import 'package:direcrot_mobile_new/services/local_storage.dart';
import 'package:direcrot_mobile_new/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'settings_events.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UpdatePhoneNumber _updatePhoneNumber;
  final GetLicenseData _getLicenseData;
  SettingsBloc(
      {required UpdatePhoneNumber updatePhoneNumber,
      required GetLicenseData getLicenseData})
      : _updatePhoneNumber = updatePhoneNumber,
        _getLicenseData = getLicenseData,
        super(const SettingsState()) {
    on<LoadUserInfo>(_loadUserInfo);
    on<LoadProfileInfo>(_loadProfileInfo);
    on<UploadFile>(_uploadFile);
    on<UpdatePhoneNumberFetch>(_phoneNumberFetch);
    on<LicenseDataFetch>(_licenseDataFetch);
  }

  void _loadUserInfo(LoadUserInfo event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    final name = await LocalStorage().readValue('name');
    final schoolName = await LocalStorage().readValue('schoolName');
    final phoneNumber = await LocalStorage().readValue('phoneNumber');
    final email = await LocalStorage().readValue('email');
    String? profileImage = await LocalStorage().readValue('imagePath');
    if (await File(profileImage ?? '').exists()) {
      debugPrint('Файл найден: $profileImage');
    } else {
      profileImage = null;
      debugPrint('Файл не найден: $profileImage');
    }
    emit(state.copyWith(
        status: SettingsStatus.success,
        fullName: name,
        schoolName: schoolName,
        email: email,
        phoneNumber: phoneNumber,
        imagePath: profileImage,
        phoneController: TextEditingController(text: phoneNumber)));
  }

  void _loadProfileInfo(
      LoadProfileInfo event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    String? selectedImagePath = await LocalStorage().readValue('imagePath');
    if (await File(selectedImagePath ?? '').exists()) {
      debugPrint('Файл найден: $selectedImagePath');
    } else {
      selectedImagePath = null;
      debugPrint('Файл не найден: $selectedImagePath');
    }
    emit(state.copyWith(
        imagePath: selectedImagePath, status: SettingsStatus.success));
  }

  void _uploadFile(UploadFile event, Emitter<SettingsState> emit) async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    SessionController().saveUserImage(returnedImage!.path);
    emit(state.copyWith(
        status: SettingsStatus.success, imagePath: returnedImage.path));
  }

  void _phoneNumberFetch(
      UpdatePhoneNumberFetch event, Emitter<SettingsState> emit) async {
    final res = await _updatePhoneNumber(
        PhoneNumberParams(phoneNumber: event.phoneNumber), null);
    res.fold(
        (failure) => emit(state.copyWith(
            profileStatus: ProfileStatus.failure,
            error: failure.message)), (data) {
      SessionController().savePhoneNumber(event.phoneNumber);
      emit(state.copyWith(
          profileStatus: ProfileStatus.success, successData: data));
    });
  }

  void _licenseDataFetch(
      LicenseDataFetch event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    final res = await _getLicenseData(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: SettingsStatus.failure, error: failure.message)),
        (license) => emit(
            state.copyWith(status: SettingsStatus.success, license: license)));
  }
}
