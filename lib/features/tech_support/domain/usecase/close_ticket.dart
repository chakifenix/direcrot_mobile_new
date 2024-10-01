import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:fpdart/src/either.dart';

class CloseTicketPut implements UseCase<String, NoParams> {
  final SupportRepository supportRepository;
  CloseTicketPut(this.supportRepository);

  @override
  Future<Either<Failure, String>> call(NoParams params, String? path) async {
    return await supportRepository.closeTicket(path!);
  }
}
