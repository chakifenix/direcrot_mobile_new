import 'package:direcrot_mobile_new/features/main/domain/entities/personal.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/student.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/teacher.dart';

class TodayStats {
  TodayStats(
      {required this.student, required this.teacher, required this.personal});
  final Student student;
  final Teacher teacher;
  final Personal personal;
}
