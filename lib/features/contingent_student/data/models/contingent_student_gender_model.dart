import 'package:direcrot_mobile_new/features/contingent_student/domain/entities/contingent_student_gender.dart';

class ContingentStudentGenderModel extends ContingentStudentGender {
  ContingentStudentGenderModel(
      {required super.maleCount, required super.femaleCount});

  factory ContingentStudentGenderModel.fromjson(Map<String, dynamic> map) {
    return ContingentStudentGenderModel(
      maleCount: map['male_count'],
      femaleCount: map['female_count'],
    );
  }
}
