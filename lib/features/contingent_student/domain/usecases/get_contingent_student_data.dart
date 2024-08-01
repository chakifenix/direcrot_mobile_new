import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/repositories/contingent_student_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetContingentStudentData
    implements UseCase<List<ContingentStudent>, ContingentStudentParams> {
  final ContingentStudentRepository contingentStudentRepository;
  GetContingentStudentData(this.contingentStudentRepository);
  @override
  Future<Either<Failure, List<ContingentStudent>>> call(
      ContingentStudentParams params, String? path) async {
    return await contingentStudentRepository
        .getContingentStudentData(params.page);
  }
}

class ContingentStudentParams {
  final int page;
  ContingentStudentParams({required this.page});
}
