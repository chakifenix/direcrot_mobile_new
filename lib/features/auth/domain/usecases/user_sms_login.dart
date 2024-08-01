import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';
import 'package:direcrot_mobile_new/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSmsLogin implements UseCase<User, UserSmsLoginParams> {
  const UserSmsLogin(this.authRepository);
  final AuthRepository authRepository;
  @override
  Future<Either<Failure, User>> call(
      UserSmsLoginParams params, String? path) async {
    return await authRepository.loginWithSms(
        code: params.code, iin: params.iin);
  }
}

class UserSmsLoginParams {
  UserSmsLoginParams({required this.code, required this.iin});
  final String code;
  final String iin;
}
