import 'package:direcrot_mobile_new/features/main/domain/entities/personal.dart';

class PersonalModel extends Personal {
  PersonalModel({required super.count, required super.passed});
  factory PersonalModel.fromjson(Map<String, dynamic> map) {
    return PersonalModel(count: map['count'], passed: map['passed']);
  }

  PersonalModel copyWith({
    int? count,
    int? passed,
  }) {
    return PersonalModel(
      count: count ?? this.count,
      passed: passed ?? this.passed,
    );
  }
}
