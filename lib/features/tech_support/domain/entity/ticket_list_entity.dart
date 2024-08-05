class TicketListEntity {
  int id;
  String ticketUid;
  String title;
  dynamic categoryName;
  DateTime createdAt;
  String statusName;

  TicketListEntity({
    required this.id,
    required this.ticketUid,
    required this.title,
    required this.categoryName,
    required this.createdAt,
    required this.statusName,
  });
}
