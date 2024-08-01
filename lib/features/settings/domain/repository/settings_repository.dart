import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SettingsRepository {
  Future<Either<Failure, String>> updatePhoneNumber(
      {required String phoneNumber});
  Future<Either<Failure, LicenseEntity>> getLicenseData();
}
