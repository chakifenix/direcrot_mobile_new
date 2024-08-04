part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? message;
  final String? email;
  final User? user;
  final String? fullName;
  final String? imagePath;
  final String? genderId;

  const AuthState(
      {this.status = AuthStatus.initial,
      this.message,
      this.user,
      this.email,
      this.fullName,
      this.imagePath,
      this.genderId});

  @override
  List<Object?> get props =>
      [status, message, user, email, fullName, imagePath, genderId];

  bool get isInitial => status == AuthStatus.initial;
  bool get isLoading => status == AuthStatus.loading;
  bool get isSuccess => status == AuthStatus.success;
  bool get isFailure => status == AuthStatus.failure;

  AuthState copyWith(
      {AuthStatus? status,
      String? message,
      User? user,
      String? email,
      String? fullName,
      String? imagePath,
      String? genderId}) {
    return AuthState(
        status: status ?? this.status,
        message: message ?? this.message,
        user: user ?? this.user,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        imagePath: imagePath ?? this.imagePath,
        genderId: genderId ?? this.genderId);
  }
}
