import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/settings/data/data_source/settings_data_source.dart';
import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';
import 'package:direcrot_mobile_new/features/settings/domain/repository/settings_repository.dart';
import 'package:fpdart/fpdart.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource settingsDataSource;
  SettingsRepositoryImpl(this.settingsDataSource);
  @override
  Future<Either<Failure, String>> updatePhoneNumber(
      {required String phoneNumber}) async {
    return _updatePhoneNumber(() async =>
        await settingsDataSource.updatePhoneNumber(phoneNumber: phoneNumber));
  }

  Future<Either<Failure, String>> _updatePhoneNumber(
      Future<String> Function() fn) async {
    try {
      final data = await fn();
      return right(data);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, LicenseEntity>> getLicenseData() async {
    return _getLicenseData(
        () async => await settingsDataSource.getLicenseData());
  }

  Future<Either<Failure, LicenseEntity>> _getLicenseData(
      Future<LicenseEntity> Function() fn) async {
    try {
      final data = await fn();
      return right(data);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
