import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:fpdart/src/either.dart';

class GetTicketList implements UseCase<List<TicketListEntity>, NoParams> {
  final SupportRepository supportRepository;
  GetTicketList(this.supportRepository);
  @override
  Future<Either<Failure, List<TicketListEntity>>> call(
      NoParams params, String? path) async {
    return await supportRepository.getTicketList();
  }
}
