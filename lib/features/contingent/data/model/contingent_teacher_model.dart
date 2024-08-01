import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_teacher.dart';

class ContingentTeacherModel extends ContingentTeacher {
  const ContingentTeacherModel(
      {required super.id,
      required super.genderId,
      required super.fullName,
      required super.specialty,
      required super.uid});

  factory ContingentTeacherModel.fromjson(Map<String, dynamic> map) {
    return ContingentTeacherModel(
        id: map['id'],
        genderId: map['gender_id'],
        fullName: map['full_name'],
        specialty: map['specialty'],
        uid: map['uid']);
  }

  ContingentTeacherModel copyWith(
      {int? id, int? genderId, String? fullName, String? specialty, int? uid}) {
    return ContingentTeacherModel(
        id: id ?? this.id,
        genderId: genderId ?? this.genderId,
        fullName: fullName ?? this.fullName,
        specialty: specialty ?? this.specialty,
        uid: uid ?? this.uid);
  }
}
