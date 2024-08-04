import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';
import 'package:direcrot_mobile_new/core/common/entities/contingent_student_gender.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ContingentStudentRepository {
  Future<Either<Failure, List<ContingentStudent>>> getContingentStudentData(
      int page);

  Future<Either<Failure, ContingentStudentGender>>
      getContingentStudentGenderData();
}
