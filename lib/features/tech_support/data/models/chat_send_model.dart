import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_send_entity.dart';

class ChatSendModel extends ChatSendEntity {
  ChatSendModel(
      {required super.ticketUid,
      required super.createdBy,
      required super.createdByType,
      required super.messageBody,
      required super.orderNum,
      required super.updatedAt,
      required super.createdAt,
      required super.id});

  factory ChatSendModel.fromJson(Map<String, dynamic> json) => ChatSendModel(
        ticketUid: json["ticket_uid"],
        createdBy: json["created_by"],
        createdByType: json["created_by_type"],
        messageBody: json["message_body"],
        orderNum: json["order_num"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );
}
