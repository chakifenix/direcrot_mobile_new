import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/skud/domain/entities/skud_entity.dart';
import 'package:direcrot_mobile_new/features/skud/domain/repository/skud_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetSkudList implements UseCase<List<SkudEntity>, SkudListParams> {
  final SkudRepository skudRepository;
  GetSkudList(this.skudRepository);

  @override
  Future<Either<Failure, List<SkudEntity>>> call(
      SkudListParams params, String? path) async {
    return await skudRepository.getSkudList(params.page, params.passType);
  }
}

class SkudListParams {
  final int page;
  final int? passType;

  SkudListParams({required this.page, this.passType});
}
