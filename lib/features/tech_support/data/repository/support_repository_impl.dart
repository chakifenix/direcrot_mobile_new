import 'package:direcrot_mobile_new/core/internet_services/error/exceptions.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/data_source/support_data_source.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_send_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/create_ticket_entity.dart';
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
  Future<Either<Failure, CreateTicketEntity>> createTicket(
      String initMessage, String title, List<XFile> files) {
    return _createTicket(
      () async =>
          await supportDataSource.createTicket(initMessage, title, files),
    );
  }

  Future<Either<Failure, CreateTicketEntity>> _createTicket(
      Future<CreateTicketEntity> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ChatListEntity>>> getChatList(String path) {
    return _getChatList(() async => await supportDataSource.getChat(path));
  }

  Future<Either<Failure, List<ChatListEntity>>> _getChatList(
      Future<List<ChatListEntity>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, ChatSendEntity>> sendChat(
      String message, String orderNum, String path) {
    return _sendChat(
        () async => await supportDataSource.sendChat(message, orderNum, path));
  }

  Future<Either<Failure, ChatSendEntity>> _sendChat(
      Future<ChatSendEntity> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> closeTicket(String path) {
    return _closeTicket(() async => await supportDataSource.closeTicket(path));
  }

  Future<Either<Failure, String>> _closeTicket(
      Future<String> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> evaluateTicket(String grade, String path) {
    return _evaluateTicket(
        () async => await supportDataSource.ticketEvaluate(grade, path));
  }

  Future<Either<Failure, String>> _evaluateTicket(
      Future<String> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
