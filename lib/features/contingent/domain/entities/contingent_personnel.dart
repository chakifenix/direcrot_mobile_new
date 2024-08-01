import 'package:equatable/equatable.dart';

class ContingentPersonnel extends Equatable {
  const ContingentPersonnel({
    required this.id,
    required this.fullName,
    required this.specialty,
    required this.uid,
    required this.genderId,
  });
  final int id;
  final String fullName;
  final String specialty;
  final int uid;
  final int genderId;

  @override
  List<Object?> get props => [id, fullName, specialty, uid, genderId];
}
