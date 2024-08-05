import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';

class TicketListModel extends TicketListEntity {
  TicketListModel(
      {required super.id,
      required super.ticketUid,
      required super.title,
      required super.categoryName,
      required super.createdAt,
      required super.statusName});

  factory TicketListModel.fromJson(Map<String, dynamic> json) =>
      TicketListModel(
        id: json["id"],
        ticketUid: json["ticket_uid"],
        title: json["title"],
        categoryName: json["category_name"],
        createdAt: DateTime.parse(json["created_at"]),
        statusName: json["status_name"],
      );
}
