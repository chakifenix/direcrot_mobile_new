import 'package:direcrot_mobile_new/features/profile_page/domain/entities/pass_entity.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/entities/profile_entity.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/usecases/get_pass_info.dart';
import 'package:direcrot_mobile_new/features/profile_page/domain/usecases/get_profile_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_events.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileInfo _getProfileInfo;
  final GetPassInfo _getPassInfo;
  ProfileBloc(
      {required GetProfileInfo getProfileInfo,
      required GetPassInfo getPassInfo})
      : _getProfileInfo = getProfileInfo,
        _getPassInfo = getPassInfo,
        super(const ProfileState()) {
    on<ProfileInfoFetch>(_profileInfoFetch);
    on<PassInfoFetch>(_passInfoFetch);
  }

  void _profileInfoFetch(
      ProfileInfoFetch event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.initial));
    final res = await _getProfileInfo(UserId(id: event.id), null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: ProfileStatus.failure, error: failure.message)),
        (profileInfo) => emit(state.copyWith(
            status: ProfileStatus.success, profileInfo: profileInfo)));
  }

  void _passInfoFetch(PassInfoFetch event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(passStatus: PassStatus.initial));
    final res = await _getPassInfo(PassUserIdParams(id: event.id), null);
    res.fold(
        (failure) => emit(state.copyWith(
            passStatus: PassStatus.failure, error: failure.message)),
        (passInfo) => emit(state.copyWith(
            passStatus: PassStatus.success, passInfo: passInfo)));
  }
}
