import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/lgotniki/domain/repostory/lgotniki_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetLgotnikiData
    implements UseCase<List<ContingentStudent>, LgotnikiParams> {
  final LgotnikiRepository lgotnikiRepository;
  GetLgotnikiData(this.lgotnikiRepository);
  @override
  Future<Either<Failure, List<ContingentStudent>>> call(
      LgotnikiParams params, String? path) async {
    return await lgotnikiRepository.getLgotnikiData(params.page);
  }
}

class LgotnikiParams {
  final int page;
  LgotnikiParams({required this.page});
}
