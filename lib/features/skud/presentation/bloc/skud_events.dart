part of 'skud_bloc.dart';

abstract class SkudEvent extends Equatable {
  const SkudEvent();

  @override
  List<Object> get props => [];
}

class SkudListDataFetch extends SkudEvent {
  final int? page;
  final int? passType;
  final String? dateFrom;
  final String? dateTo;

  const SkudListDataFetch(
      {this.page, this.passType, this.dateFrom, this.dateTo});
}
