import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_gender.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_personnel.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_teacher.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ContingentRepository {
  Future<Either<Failure, Contingent>> getContingentData();
  Future<Either<Failure, List<ContingentTeacher>>> getContingentTeacherData(
      int page);
  Future<Either<Failure, ContingentGender>> getContingentGender(
      {required int gender, required String path});
  Future<Either<Failure, List<ContingentPersonnel>>>
      getContingentPersonnelData();
  Future<Either<Failure, Map<String, dynamic>>> getContingentStudentData();
}
