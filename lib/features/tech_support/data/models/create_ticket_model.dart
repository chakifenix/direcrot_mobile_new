import 'package:direcrot_mobile_new/features/tech_support/domain/entity/create_ticket_entity.dart';

class CreateTicketModel extends CreateTicketEntity {
  CreateTicketModel(
      {required super.ticketUid,
      required super.title,
      required super.initialMessage,
      required super.serviceTypesId,
      required super.createdBy,
      required super.updatedAt,
      required super.createdAt,
      required super.id});

  factory CreateTicketModel.fromJson(Map<String, dynamic> json) =>
      CreateTicketModel(
        ticketUid: json["ticket_uid"],
        title: json["title"],
        initialMessage: json["initial_message"],
        serviceTypesId: json["service_types_id"],
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );
}
