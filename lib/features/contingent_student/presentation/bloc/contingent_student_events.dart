part of 'contingent_student_bloc.dart';

abstract class ContingentStudentEvent extends Equatable {
  const ContingentStudentEvent();

  @override
  List<Object> get props => [];
}

class ContingentStudentDataFetch extends ContingentStudentEvent {
  final int? page;
  const ContingentStudentDataFetch({this.page});
}

class ContingentStudentGenderFetch extends ContingentStudentEvent {}
