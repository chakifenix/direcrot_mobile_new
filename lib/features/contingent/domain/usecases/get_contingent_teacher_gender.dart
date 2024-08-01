import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_gender.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/repositories/contingent_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetContingentTeacherGender
    implements UseCase<ContingentGender, ContingentGenderParams> {
  final ContingentRepository contingentRepository;

  GetContingentTeacherGender(this.contingentRepository);
  @override
  Future<Either<Failure, ContingentGender>> call(
      ContingentGenderParams params, String? path) async {
    return contingentRepository.getContingentGender(
        gender: params.gender, path: path!);
  }
}

class ContingentGenderParams {
  final int gender;

  ContingentGenderParams({required this.gender});
}
