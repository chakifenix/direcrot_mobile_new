import 'package:equatable/equatable.dart';

class Contingent extends Equatable {
  const Contingent(
      {required this.student, required this.teacher, required this.personnel});
  final int student;
  final int teacher;
  final int personnel;

  @override
  List<Object?> get props => [student, teacher, personnel];
}
