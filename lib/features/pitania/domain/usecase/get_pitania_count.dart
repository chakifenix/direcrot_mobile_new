import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_meta_entity.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/repository/pitania_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetPitaniaCount
    implements UseCase<PitaniaMetaEntity, PitaniaCountParams> {
  final PitaniaRepository pitaniaRepository;
  GetPitaniaCount(this.pitaniaRepository);
  @override
  Future<Either<Failure, PitaniaMetaEntity>> call(
      PitaniaCountParams params, String? path) async {
    return await pitaniaRepository.getPitaniaCount(
        params.isFoodFree, params.classAt, params.classTo);
  }
}

class PitaniaCountParams {
  final int? isFoodFree;
  final int? classAt;
  final int? classTo;
  PitaniaCountParams(this.isFoodFree, this.classAt, this.classTo);
}
