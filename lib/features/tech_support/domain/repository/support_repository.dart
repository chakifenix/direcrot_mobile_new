import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SupportRepository {
  Future<Either<Failure, List<TicketListEntity>>> getTicketList();
}
