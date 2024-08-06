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

class GetChatListFetch extends SupportEvent {}

class SendMessageFetch extends SupportEvent {
  final String message;
  final String orderNum;
  SendMessageFetch(this.message, this.orderNum);
}
