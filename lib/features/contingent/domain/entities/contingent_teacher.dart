import 'package:equatable/equatable.dart';

class ContingentTeacher extends Equatable {
  const ContingentTeacher(
      {required this.id,
      required this.genderId,
      required this.fullName,
      required this.specialty,
      required this.uid});
  final int id;
  final int genderId;
  final String fullName;
  final String specialty;
  final int uid;

  @override
  List<Object?> get props => [id, genderId, fullName, specialty, uid];
}
