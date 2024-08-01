import 'package:direcrot_mobile_new/features/main/domain/entities/teacher.dart';

class TeacherModel extends Teacher {
  TeacherModel({required super.count, required super.passed});
  factory TeacherModel.fromjson(Map<String, dynamic> map) {
    return TeacherModel(count: map['count'], passed: map['passed']);
  }

  TeacherModel copyWith({
    int? count,
    int? passed,
  }) {
    return TeacherModel(
      count: count ?? this.count,
      passed: passed ?? this.passed,
    );
  }
}
