import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_teacher.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/repositories/contingent_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetContingentTeacherData
    implements UseCase<List<ContingentTeacher>, ContingentTeacherParams> {
  final ContingentRepository contingentRepository;
  GetContingentTeacherData(this.contingentRepository);

  @override
  Future<Either<Failure, List<ContingentTeacher>>> call(
      ContingentTeacherParams params, String? path) async {
    return await contingentRepository.getContingentTeacherData(params.page);
  }
}

class ContingentTeacherParams {
  final int page;

  ContingentTeacherParams({required this.page});
}
