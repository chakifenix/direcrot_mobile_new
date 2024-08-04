part of 'skud_bloc.dart';

abstract class SkudEvent extends Equatable {
  const SkudEvent();

  @override
  List<Object> get props => [];
}

class SkudListDataFetch extends SkudEvent {
  final int? page;
  final int? passType;
  const SkudListDataFetch({this.page, this.passType});
}
