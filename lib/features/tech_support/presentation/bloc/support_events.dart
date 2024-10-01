part of 'support_bloc.dart';

abstract class SupportEvent extends Equatable {
  const SupportEvent();

  @override
  List<Object> get props => [];
}

class TicketListFetch extends SupportEvent {}

class CreateTicketFetch extends SupportEvent {
  final String initMessage;
  final String title;
  final List<XFile> files;
  CreateTicketFetch(
      {required this.initMessage, required this.title, required this.files});
}

class ImportFile extends SupportEvent {}

class GetChatListFetch extends SupportEvent {
  final String ticketId;
  GetChatListFetch(this.ticketId);
}

class SendMessageFetch extends SupportEvent {
  final String message;
  final String orderNum;
  final String path;
  SendMessageFetch(this.message, this.orderNum, this.path);
}

class FilePageFetch extends SupportEvent {}

class EvaluateTicketFetch extends SupportEvent {
  final String grade;
  final String path;
  EvaluateTicketFetch(this.grade, this.path);
}

class CloseTicketFetch extends SupportEvent {
  final String path;
  CloseTicketFetch(this.path);
}
