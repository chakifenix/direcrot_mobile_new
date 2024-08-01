import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/repositories/contingent_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetContingentData implements UseCase<Contingent, NoParams> {
  final ContingentRepository contingentRepository;
  GetContingentData(this.contingentRepository);

  @override
  Future<Either<Failure, Contingent>> call(
      NoParams params, String? path) async {
    return await contingentRepository.getContingentData();
  }
}
