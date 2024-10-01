import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:fpdart/src/either.dart';

class EvaluateTicketPut implements UseCase<String, EvaluateTicketParams> {
  final SupportRepository supportRepository;
  EvaluateTicketPut(this.supportRepository);
  @override
  Future<Either<Failure, String>> call(
      EvaluateTicketParams params, String? path) async {
    return await supportRepository.evaluateTicket(params.grade, path!);
  }
}

class EvaluateTicketParams {
  final String grade;
  EvaluateTicketParams(this.grade);
}
