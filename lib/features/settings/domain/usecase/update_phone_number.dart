import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/settings/domain/repository/settings_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdatePhoneNumber implements UseCase<String, PhoneNumberParams> {
  final SettingsRepository settingsRepository;
  UpdatePhoneNumber(this.settingsRepository);
  @override
  Future<Either<Failure, String>> call(
      PhoneNumberParams params, String? path) async {
    return await settingsRepository.updatePhoneNumber(
        phoneNumber: params.phoneNumber);
  }
}

class PhoneNumberParams {
  final String phoneNumber;
  PhoneNumberParams({required this.phoneNumber});
}
