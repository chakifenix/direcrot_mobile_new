import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent.dart';

class ContingentModel extends Contingent {
  const ContingentModel(
      {required super.student,
      required super.teacher,
      required super.personnel});

  factory ContingentModel.fromjson(Map<String, dynamic> map) {
    return ContingentModel(
        student: map['student'],
        teacher: map['teacher'],
        personnel: map['personnel']);
  }

  ContingentModel copyWith({int? student, int? teacher, int? personnel}) {
    return ContingentModel(
        student: student ?? this.student,
        teacher: teacher ?? this.teacher,
        personnel: personnel ?? this.personnel);
  }
}
