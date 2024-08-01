import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class LgotnikiRepository {
  Future<Either<Failure, List<ContingentStudent>>> getLgotnikiData(int page);
}
