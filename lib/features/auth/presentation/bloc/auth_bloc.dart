import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';
import 'package:direcrot_mobile_new/features/auth/domain/usecases/user_iin_login.dart';
import 'package:direcrot_mobile_new/features/auth/domain/usecases/user_sms_login.dart';
import 'package:direcrot_mobile_new/services/local_storage.dart';
import 'package:direcrot_mobile_new/services/session_manager/session_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserIinLogin _userIinLogin;
  final UserSmsLogin _userSmsLogin;
  AuthBloc(
      {required UserIinLogin userIinLogin, required UserSmsLogin userSmsLogin})
      : _userIinLogin = userIinLogin,
        _userSmsLogin = userSmsLogin,
        super(const AuthState()) {
    on<AuthEvent>(
        (_, emit) => emit(state.copyWith(status: AuthStatus.loading)));
    on<AuthIinLogin>(_getIinMessage);
    on<AuthSmsLogin>(_getSmsAnswer);
    on<LoadUserInfo>(_getUserInfo);
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
    emit(state.copyWith(fullName: name, status: AuthStatus.success));
  }
}
