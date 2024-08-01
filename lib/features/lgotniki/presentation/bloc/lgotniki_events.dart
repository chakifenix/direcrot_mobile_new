part of 'lgotniki_bloc.dart';

abstract class LgotnikiEvent extends Equatable {
  const LgotnikiEvent();

  @override
  List<Object> get props => [];
}

class LgotnikiDataFetch extends LgotnikiEvent {
  final int? page;
  const LgotnikiDataFetch({this.page});
}
