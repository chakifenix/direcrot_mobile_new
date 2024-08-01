import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_entity.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_meta_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PitaniaRepository {
  Future<Either<Failure, List<PitaniaEntity>>> getPitaniaList(int page);
  Future<Either<Failure, PitaniaMetaEntity>> getPitaniaCount(
      int? isFoodFree, int? classAt, int? classTo);
}
