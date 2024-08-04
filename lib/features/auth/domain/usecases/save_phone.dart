import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SavePhoneNumber implements UseCase<String, PhoneNumberParams> {
  final AuthRepository authRepository;
  SavePhoneNumber(this.authRepository);
  @override
  Future<Either<Failure, String>> call(
      PhoneNumberParams params, String? path) async {
    return await authRepository.updatePhoneNumber(
        phoneNumber: params.phoneNumber);
  }
}

class PhoneNumberParams {
  final String phoneNumber;
  PhoneNumberParams({required this.phoneNumber});
}
