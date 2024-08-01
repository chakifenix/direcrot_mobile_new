import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';
import 'package:direcrot_mobile_new/features/settings/domain/repository/settings_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetLicenseData implements UseCase<LicenseEntity, NoParams> {
  final SettingsRepository settingsRepository;
  GetLicenseData(this.settingsRepository);

  @override
  Future<Either<Failure, LicenseEntity>> call(
      NoParams params, String? path) async {
    return await settingsRepository.getLicenseData();
  }
}
