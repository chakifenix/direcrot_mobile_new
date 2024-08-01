import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/entities/contingent_student_gender.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/repositories/contingent_student_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetContingentStudentGenderData
    implements UseCase<ContingentStudentGender, NoParams> {
  final ContingentStudentRepository contingentStudentRepository;
  GetContingentStudentGenderData(this.contingentStudentRepository);
  @override
  Future<Either<Failure, ContingentStudentGender>> call(
      NoParams params, String? path) async {
    return await contingentStudentRepository.getContingentStudentGenderData();
  }
}
