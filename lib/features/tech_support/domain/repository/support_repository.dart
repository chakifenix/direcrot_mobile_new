import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_send_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/create_ticket_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class SupportRepository {
  Future<Either<Failure, List<TicketListEntity>>> getTicketList();
  Future<Either<Failure, CreateTicketEntity>> createTicket(
      String initMessage, String title, List<XFile> files);
  Future<Either<Failure, List<ChatListEntity>>> getChatList(String path);
  Future<Either<Failure, ChatSendEntity>> sendChat(
      String message, String orderNum, String path);
  Future<Either<Failure, String>> evaluateTicket(String grade, String path);
  Future<Either<Failure, String>> closeTicket(String path);
}
