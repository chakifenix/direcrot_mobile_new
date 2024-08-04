part of 'pitania_bloc.dart';

abstract class PitaniaEvent extends Equatable {
  const PitaniaEvent();

  @override
  List<Object> get props => [];
}

class PitaniaListFetch extends PitaniaEvent {
  final int? page;
  final int? classFrom;
  final int? classTo;
  final String? dateFrom;
  final String? dateTo;
  const PitaniaListFetch(
      {this.page, this.classFrom, this.classTo, this.dateFrom, this.dateTo});
}

class PitaniaCountFetch extends PitaniaEvent {}
