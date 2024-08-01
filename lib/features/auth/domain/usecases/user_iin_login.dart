import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/iin_answer.dart';
import 'package:direcrot_mobile_new/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserIinLogin implements UseCase<IinAnswer, UserIinLoginParams> {
  final AuthRepository authRepository;
  const UserIinLogin(this.authRepository);

  @override
  Future<Either<Failure, IinAnswer>> call(
      UserIinLoginParams params, String? path) async {
    return await authRepository.loginWithIin(iin: params.iin);
  }
}

class UserIinLoginParams {
  final String iin;

  UserIinLoginParams({required this.iin});
}
