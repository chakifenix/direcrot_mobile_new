import 'dart:io';

import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';
import 'package:direcrot_mobile_new/features/auth/domain/usecases/save_phone.dart';
import 'package:direcrot_mobile_new/features/auth/domain/usecases/user_iin_login.dart';
import 'package:direcrot_mobile_new/features/auth/domain/usecases/user_sms_login.dart';
import 'package:direcrot_mobile_new/services/local_storage.dart';
import 'package:direcrot_mobile_new/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserIinLogin _userIinLogin;
  final UserSmsLogin _userSmsLogin;
  final SavePhoneNumber _savePhone;
  AuthBloc(
      {required UserIinLogin userIinLogin,
      required UserSmsLogin userSmsLogin,
      required SavePhoneNumber savePhone})
      : _userIinLogin = userIinLogin,
        _userSmsLogin = userSmsLogin,
        _savePhone = savePhone,
        super(const AuthState()) {
    on<AuthEvent>(
        (_, emit) => emit(state.copyWith(status: AuthStatus.loading)));
    on<AuthIinLogin>(_getIinMessage);
    on<AuthSmsLogin>(_getSmsAnswer);
    on<LoadUserInfo>(_getUserInfo);
    on<SavePhoneNumberFetch>(_phoneNumberFetch);
  }

  void _phoneNumberFetch(
      SavePhoneNumberFetch event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.initial));
    final res = await _savePhone(
        PhoneNumberParams(phoneNumber: event.phoneNumber), null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: AuthStatus.failure, message: failure.message)), (message) {
      SessionController().savePhoneNumber(event.phoneNumber);
      emit(state.copyWith(status: AuthStatus.success, message: message));
    });
  }

  void _getIinMessage(AuthIinLogin event, Emitter<AuthState> emit) async {
    final res = await _userIinLogin(UserIinLoginParams(iin: event.iin), null);
    res.fold(
        (l) => emit(
            state.copyWith(status: AuthStatus.failure, message: l.message)),
        (r) {
      emit(state.copyWith(status: AuthStatus.success, email: r.email));
      emit(state.copyWith(status: AuthStatus.initial));
    });
  }

  void _getSmsAnswer(AuthSmsLogin event, Emitter<AuthState> emit) async {
    final res = await _userSmsLogin(
        UserSmsLoginParams(code: event.code, iin: event.iin), null);

    res.fold((failure) => emit(state.copyWith(status: AuthStatus.failure)),
        (user) {
      SessionController().saveUserData(user);
      emit(
        state.copyWith(status: AuthStatus.success, user: user),
      );

      emit(state.copyWith(status: AuthStatus.initial));
    });
  }

  void _getUserInfo(LoadUserInfo event, Emitter<AuthState> emit) async {
    final name = await LocalStorage().readValue('name');
    final genderId = await LocalStorage().readValue('genderId');
    String? imagePath = await LocalStorage().readValue('imagePath');
    if (await File(imagePath ?? '').exists()) {
      debugPrint('Файл найден: $imagePath');
    } else {
      imagePath = null;
      debugPrint('Файл не найден: $imagePath');
    }
    emit(state.copyWith(
        genderId: genderId,
        fullName: name,
        imagePath: imagePath,
        status: AuthStatus.success));
  }
}
