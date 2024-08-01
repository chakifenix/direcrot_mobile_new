part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInfoFetch extends ProfileEvent {
  final int id;
  const ProfileInfoFetch(this.id);
}

class PassInfoFetch extends ProfileEvent {
  final int id;
  const PassInfoFetch(this.id);
}
