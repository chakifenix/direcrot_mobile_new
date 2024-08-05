import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/skud/domain/entities/skud_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SkudRepository {
  Future<Either<Failure, List<SkudEntity>>> getSkudList(
      int page, int? passType, String? dateFrom, String? dateTo);
}
