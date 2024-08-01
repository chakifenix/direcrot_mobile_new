part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

final class TodayStatsFetch extends MainEvent {}

final class LicenseDataFetch extends MainEvent {}
