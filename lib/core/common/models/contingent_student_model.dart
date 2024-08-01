import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';

class ContingentStudentModel extends ContingentStudent {
  ContingentStudentModel(
      {required super.id,
      required super.fullName,
      required super.classNumber,
      required super.isFoodFree,
      required super.genderId});

  factory ContingentStudentModel.fromjson(Map<String, dynamic> map) {
    return ContingentStudentModel(
      id: map['id'],
      fullName: map['full_name'],
      classNumber: map['class'],
      isFoodFree: map['is_food_free'],
      genderId: map['gender_id'],
    );
  }
}
