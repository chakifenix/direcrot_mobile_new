part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

enum PassStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  final ProfileStatus status;
  final PassStatus passStatus;
  final ProfileEntity? profileInfo;
  final List<PassEntity> passInfo;
  final String? error;

  const ProfileState(
      {this.status = ProfileStatus.initial,
      this.passStatus = PassStatus.initial,
      this.profileInfo,
      this.passInfo = const [],
      this.error});

  @override
  List<Object?> get props => [status, passStatus, profileInfo, passInfo, error];

  bool get isInitial => status == ProfileStatus.initial;
  bool get isLoading => status == ProfileStatus.loading;
  bool get isSuccess => status == ProfileStatus.success;
  bool get isFailure => status == ProfileStatus.failure;

  bool get isPassInitial => passStatus == PassStatus.initial;
  bool get isPassLoading => passStatus == PassStatus.loading;
  bool get isPassSuccess => passStatus == PassStatus.success;
  bool get isPassFailure => passStatus == PassStatus.failure;

  ProfileState copyWith({
    ProfileStatus? status,
    PassStatus? passStatus,
    ProfileEntity? profileInfo,
    List<PassEntity>? passInfo,
    String? error,
  }) {
    return ProfileState(
        status: status ?? this.status,
        passStatus: passStatus ?? this.passStatus,
        profileInfo: profileInfo ?? this.profileInfo,
        passInfo: passInfo ?? this.passInfo,
        error: error ?? this.error);
  }
}
