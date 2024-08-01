import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/main/data/datasources/main_data_source.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/today_stats.dart';
import 'package:direcrot_mobile_new/features/main/domain/repositories/main_repository.dart';
import 'package:fpdart/fpdart.dart';

class MainRepositoryImpl implements MainRepository {
  MainRepositoryImpl(this.mainDataSource);
  final MainDataSource mainDataSource;

  @override
  Future<Either<Failure, TodayStats>> getTodayStats() async {
    return _getTodayStats(() async => await mainDataSource.getTodayStats());
  }

  Future<Either<Failure, TodayStats>> _getTodayStats(
    Future<TodayStats> Function() fn,
  ) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, LicenseEntity>> getLicenseData() async {
    return _getLicenseData(() async => await mainDataSource.getLicense());
  }

  Future<Either<Failure, LicenseEntity>> _getLicenseData(
      Future<LicenseEntity> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
