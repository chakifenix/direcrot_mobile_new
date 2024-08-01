import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/contingent/data/datasource/contingent_data_source.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_gender.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_personnel.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_teacher.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/repositories/contingent_repository.dart';
import 'package:fpdart/fpdart.dart';

class ContingentRepositoryImpl implements ContingentRepository {
  final ContingentDataSource contingentDataSource;
  ContingentRepositoryImpl(this.contingentDataSource);

  @override
  Future<Either<Failure, Contingent>> getContingentData() async {
    return _getContingentData(
        () async => await contingentDataSource.getContingentData());
  }

  Future<Either<Failure, Contingent>> _getContingentData(
    Future<Contingent> Function() fn,
  ) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ContingentTeacher>>> getContingentTeacherData(
      int page) async {
    return _getContingentTeacherData(
        () async => await contingentDataSource.getContingentTeacherModel(page));
  }

  Future<Either<Failure, List<ContingentTeacher>>> _getContingentTeacherData(
    Future<List<ContingentTeacher>> Function() fn,
  ) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ContingentGender>> getContingentGender(
      {required int gender, required String path}) async {
    return _getContingentGender(() async =>
        await contingentDataSource.getContingentGenderData(gender, path));
  }

  Future<Either<Failure, ContingentGender>> _getContingentGender(
    Future<ContingentGender> Function() fn,
  ) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ContingentPersonnel>>>
      getContingentPersonnelData() async {
    return _getContingentPersonnelData(
        () async => await contingentDataSource.getContingentPersonnel());
  }

  Future<Either<Failure, List<ContingentPersonnel>>>
      _getContingentPersonnelData(
    Future<List<ContingentPersonnel>> Function() fn,
  ) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>>
      getContingentStudentData() async {
    return _getContingentStudentData(
        () async => await contingentDataSource.getContingentStudent());
  }

  Future<Either<Failure, Map<String, dynamic>>> _getContingentStudentData(
    Future<Map<String, dynamic>> Function() fn,
  ) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
