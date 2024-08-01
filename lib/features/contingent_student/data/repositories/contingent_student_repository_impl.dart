import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/contingent_student/data/data_source/contingent_student_data_source.dart';
import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/entities/contingent_student_gender.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/repositories/contingent_student_repository.dart';
import 'package:fpdart/fpdart.dart';

class ContingentStudentRepositoryImpl implements ContingentStudentRepository {
  final ContingentStudentDataSource contingentStudentDataSource;
  ContingentStudentRepositoryImpl(this.contingentStudentDataSource);
  @override
  Future<Either<Failure, List<ContingentStudent>>> getContingentStudentData(
      int page) async {
    return _getContingentStudentData(() async =>
        await contingentStudentDataSource.getContingentStudentDataSource(page));
  }

  Future<Either<Failure, List<ContingentStudent>>> _getContingentStudentData(
      Future<List<ContingentStudent>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ContingentStudentGender>>
      getContingentStudentGenderData() async {
    return _getContingentStudentGenderData(() async =>
        await contingentStudentDataSource.getContingentStudentGenderData());
  }

  Future<Either<Failure, ContingentStudentGender>>
      _getContingentStudentGenderData(
          Future<ContingentStudentGender> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
