import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/today_stats.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class MainRepository {
  Future<Either<Failure, TodayStats>> getTodayStats();
  Future<Either<Failure, LicenseEntity>> getLicenseData();
}
