part of 'skud_bloc.dart';

abstract class SkudEvent extends Equatable {
  const SkudEvent();

  @override
  List<Object> get props => [];
}

class SkudListDataFetch extends SkudEvent {
  final int? page;
  const SkudListDataFetch({this.page});
}
