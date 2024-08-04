import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';
import 'package:direcrot_mobile_new/core/common/entities/contingent_student_gender.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/exceptions.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/lgotniki/data/data_source/lgotniki_data_source.dart';
import 'package:direcrot_mobile_new/features/lgotniki/domain/repostory/lgotniki_repository.dart';
import 'package:fpdart/fpdart.dart';

class LgotnikiRepositoryImpl implements LgotnikiRepository {
  final LgotnikiDataSource lgotnikiDataSource;
  LgotnikiRepositoryImpl(this.lgotnikiDataSource);
  @override
  Future<Either<Failure, List<ContingentStudent>>> getLgotnikiData(
      int page) async {
    return _getlgotnikiData(
        () async => await lgotnikiDataSource.getLgotnikiDataSource(page));
  }

  Future<Either<Failure, List<ContingentStudent>>> _getlgotnikiData(
      Future<List<ContingentStudent>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, ContingentStudentGender>> getLgotnikiGender() {
    return _getLgotnikiGender(
        () async => await lgotnikiDataSource.getGenderCount());
  }

  Future<Either<Failure, ContingentStudentGender>> _getLgotnikiGender(
      Future<ContingentStudentGender> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
