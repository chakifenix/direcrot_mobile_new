import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params, String? path);
}

class NoParams {}
