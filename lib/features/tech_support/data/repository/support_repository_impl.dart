import 'package:direcrot_mobile_new/core/internet_services/error/exceptions.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/data_source/support_data_source.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:fpdart/src/either.dart';

class SupportRepositoryImpl implements SupportRepository {
  final SupportDataSource supportDataSource;
  SupportRepositoryImpl(this.supportDataSource);
  @override
  Future<Either<Failure, List<TicketListEntity>>> getTicketList() async {
    return _getTicketList(() async => await supportDataSource.getTicketList());
  }

  Future<Either<Failure, List<TicketListEntity>>> _getTicketList(
      Future<List<TicketListEntity>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
