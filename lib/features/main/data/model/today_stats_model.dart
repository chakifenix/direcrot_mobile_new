import 'package:direcrot_mobile_new/features/main/data/model/personal_model.dart';
import 'package:direcrot_mobile_new/features/main/data/model/student_model.dart';
import 'package:direcrot_mobile_new/features/main/data/model/teacher_model.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/personal.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/student.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/teacher.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/today_stats.dart';

class TodayStatsModel extends TodayStats {
  TodayStatsModel(
      {required super.student,
      required super.teacher,
      required super.personal});

  factory TodayStatsModel.fromjson(Map<String, dynamic> map) {
    return TodayStatsModel(
        student: StudentModel.fromjson(map['student']),
        teacher: TeacherModel.fromjson(map['teacher']),
        personal: PersonalModel.fromjson(map['personnel']));
  }

  TodayStatsModel copyWith({
    Student? student,
    Teacher? teacher,
    Personal? personal,
  }) {
    return TodayStatsModel(
      student: student ?? this.student,
      teacher: teacher ?? this.teacher,
      personal: personal ?? this.personal,
    );
  }
}
