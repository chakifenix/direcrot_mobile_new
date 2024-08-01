part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthIinLogin extends AuthEvent {
  final String iin;

  const AuthIinLogin({required this.iin});
}

final class AuthSmsLogin extends AuthEvent {
  final String code;
  final String iin;

  const AuthSmsLogin({required this.code, required this.iin});
}

final class LoadUserInfo extends AuthEvent {}
