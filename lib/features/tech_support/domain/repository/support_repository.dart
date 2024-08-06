import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class SupportRepository {
  Future<Either<Failure, List<TicketListEntity>>> getTicketList();
  Future<Either<Failure, String>> createTicket(
      String initMessage, String title, List<XFile> files);
  Future<Either<Failure, List<String>>> getChatList();
  Future<Either<Failure, String>> sendChat(String message, String orderNum);
}
