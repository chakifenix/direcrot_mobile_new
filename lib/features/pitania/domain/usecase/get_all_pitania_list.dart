import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_entity.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/repository/pitania_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllPitaniaList
    implements UseCase<List<PitaniaEntity>, PitaniaListParams> {
  final PitaniaRepository pitaniaRepository;
  GetAllPitaniaList(this.pitaniaRepository);
  @override
  Future<Either<Failure, List<PitaniaEntity>>> call(
      PitaniaListParams params, String? path) async {
    return await pitaniaRepository.getPitaniaList(params.page);
  }
}

class PitaniaListParams {
  final int page;
  PitaniaListParams({required this.page});
}
