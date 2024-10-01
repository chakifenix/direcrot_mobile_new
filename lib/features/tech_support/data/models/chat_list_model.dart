import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_list_entity.dart';

class ChatListModel extends ChatListEntity {
  ChatListModel(
      {required super.id,
      required super.ticketUid,
      required super.createdByType,
      required super.messageBody,
      required super.orderNum,
      required super.evaluation,
      required super.createdAt,
      required super.createdByName,
      super.createdByLastName,
      super.createdBySurname});

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
      id: json["id"],
      ticketUid: json["ticket_uid"],
      createdByType: json["created_by_type"],
      messageBody: json["message_body"],
      orderNum: json["order_num"],
      evaluation: json["evaluation"],
      createdAt: DateTime.parse(json["created_at"]),
      createdByName: json['created_by_name'],
      createdByLastName: json['created_by_lastname'],
      createdBySurname: json['created_by_surname']);
}
