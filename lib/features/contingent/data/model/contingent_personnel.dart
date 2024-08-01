import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_personnel.dart';

class ContingentPersonnelModel extends ContingentPersonnel {
  const ContingentPersonnelModel(
      {required super.id,
      required super.genderId,
      required super.fullName,
      required super.specialty,
      required super.uid});

  factory ContingentPersonnelModel.fromjson(Map<String, dynamic> map) {
    return ContingentPersonnelModel(
        id: map['id'],
        genderId: map['gender_id'],
        fullName: map['full_name'],
        specialty: map['specialty'],
        uid: map['uid']);
  }

  ContingentPersonnelModel copyWith(
      {int? id, int? genderId, String? fullName, String? specialty, int? uid}) {
    return ContingentPersonnelModel(
        id: id ?? this.id,
        genderId: genderId ?? this.genderId,
        fullName: fullName ?? this.fullName,
        specialty: specialty ?? this.specialty,
        uid: uid ?? this.uid);
  }
}
