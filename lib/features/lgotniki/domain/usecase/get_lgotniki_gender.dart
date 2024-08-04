import 'package:direcrot_mobile_new/core/common/entities/contingent_student_gender.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/lgotniki/domain/repostory/lgotniki_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetLgotnikiGender implements UseCase<ContingentStudentGender, NoParams> {
  final LgotnikiRepository lgotnikiRepository;
  GetLgotnikiGender(this.lgotnikiRepository);
  @override
  Future<Either<Failure, ContingentStudentGender>> call(
      NoParams params, String? path) async {
    return await lgotnikiRepository.getLgotnikiGender();
  }
}
