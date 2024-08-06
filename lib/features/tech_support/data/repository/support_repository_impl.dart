import 'package:direcrot_mobile_new/core/internet_services/error/exceptions.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/data_source/support_data_source.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/repository/support_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Future<Either<Failure, String>> createTicket(
      String initMessage, String title, List<XFile> files) {
    return _createTicket(
      () async =>
          await supportDataSource.createTicket(initMessage, title, files),
    );
  }

  Future<Either<Failure, String>> _createTicket(
      Future<String> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getChatList() {
    return _getChatList(() async => await supportDataSource.getChat());
  }

  Future<Either<Failure, List<String>>> _getChatList(
      Future<List<String>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> sendChat(String message, String orderNum) {
    return _sendChat(
        () async => await supportDataSource.sendChat(message, orderNum));
  }

  Future<Either<Failure, String>> _sendChat(
      Future<String> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
