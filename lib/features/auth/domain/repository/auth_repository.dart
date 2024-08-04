import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/iin_answer.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, IinAnswer>> loginWithIin({required String iin});
  Future<Either<Failure, User>> loginWithSms(
      {required String code, required String iin});
  Future<Either<Failure, String>> updatePhoneNumber(
      {required String phoneNumber});
}
