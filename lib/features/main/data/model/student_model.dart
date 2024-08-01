import 'package:direcrot_mobile_new/features/main/domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel(
      {required super.count, required super.passed, required super.food});
  factory StudentModel.fromjson(Map<String, dynamic> map) {
    return StudentModel(
        count: map['count'], passed: map['passed'], food: map['food']);
  }

  StudentModel copyWith({
    int? count,
    int? passed,
    int? food,
  }) {
    return StudentModel(
      count: count ?? this.count,
      passed: passed ?? this.passed,
      food: food ?? this.food,
    );
  }
}
