import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/auth/data/data_source/auth_api_service.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/iin_answer.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';
import 'package:direcrot_mobile_new/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;
  AuthRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, IinAnswer>> loginWithIin({required String iin}) async {
    return _getData(
      () async => await apiService.loginWithIIN(iin: iin),
    );
  }

  @override
  Future<Either<Failure, User>> loginWithSms(
      {required String code, required String iin}) async {
    return _getDataUser(
        () async => await apiService.loginWithSms(code: code, iin: iin));
  }

  Future<Either<Failure, IinAnswer>> _getData(
    Future<IinAnswer> Function() fn,
  ) async {
    try {
      final user = await fn();
      return right(user);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }

  Future<Either<Failure, User>> _getDataUser(
    Future<User> Function() fn,
  ) async {
    try {
      final user = await fn();
      return right(user);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
