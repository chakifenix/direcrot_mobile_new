part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? message;
  final String? email;
  final User? user;
  final String? fullName;

  const AuthState(
      {this.status = AuthStatus.initial,
      this.message,
      this.user,
      this.email,
      this.fullName});

  @override
  List<Object?> get props => [status, message, user, email, fullName];

  bool get isInitial => status == AuthStatus.initial;
  bool get isLoading => status == AuthStatus.loading;
  bool get isSuccess => status == AuthStatus.success;
  bool get isFailure => status == AuthStatus.failure;

  AuthState copyWith(
      {AuthStatus? status,
      String? message,
      User? user,
      String? email,
      String? fullName}) {
    return AuthState(
        status: status ?? this.status,
        message: message ?? this.message,
        user: user ?? this.user,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName);
  }
}
