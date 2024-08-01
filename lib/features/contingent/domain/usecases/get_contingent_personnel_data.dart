import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_personnel.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/repositories/contingent_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetContingentPersonnelData
    implements UseCase<List<ContingentPersonnel>, NoParams> {
  final ContingentRepository contingentRepository;
  GetContingentPersonnelData(this.contingentRepository);

  @override
  Future<Either<Failure, List<ContingentPersonnel>>> call(
      NoParams params, String? path) async {
    return await contingentRepository.getContingentPersonnelData();
  }
}
