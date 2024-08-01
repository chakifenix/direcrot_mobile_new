part of 'pitania_bloc.dart';

abstract class PitaniaEvent extends Equatable {
  const PitaniaEvent();

  @override
  List<Object> get props => [];
}

class PitaniaListFetch extends PitaniaEvent {
  final int? page;
  const PitaniaListFetch({this.page});
}

class PitaniaCountFetch extends PitaniaEvent {}
