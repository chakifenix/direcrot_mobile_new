class CreateTicketEntity {
  String ticketUid;
  String title;
  String initialMessage;
  String serviceTypesId;
  int createdBy;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  CreateTicketEntity({
    required this.ticketUid,
    required this.title,
    required this.initialMessage,
    required this.serviceTypesId,
    required this.createdBy,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
}
