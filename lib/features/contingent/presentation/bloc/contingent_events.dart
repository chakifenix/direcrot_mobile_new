part of 'contingent_bloc.dart';

abstract class ContingentEvent extends Equatable {
  const ContingentEvent();

  @override
  List<Object> get props => [];
}

final class ContingentDataFetch extends ContingentEvent {}

final class ContingentTeacherDataFetch extends ContingentEvent {
  const ContingentTeacherDataFetch({this.page});
  final int? page;
}

final class ContingentGenderFetch extends ContingentEvent {
  const ContingentGenderFetch({required this.path});
  final String path;
}

final class CloseBloc extends ContingentEvent {}

final class ContingentPersonnelDataFetch extends ContingentEvent {}

final class ContingentStudentDataFetch extends ContingentEvent {}
