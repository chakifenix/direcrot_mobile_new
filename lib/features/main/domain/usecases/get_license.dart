import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/main/domain/repositories/main_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetLicense implements UseCase<LicenseEntity, NoParams> {
  final MainRepository mainRepository;
  GetLicense(this.mainRepository);
  @override
  Future<Either<Failure, LicenseEntity>> call(
      NoParams params, String? path) async {
    return await mainRepository.getLicenseData();
  }
}
