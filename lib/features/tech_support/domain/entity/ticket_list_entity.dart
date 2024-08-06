class TicketListEntity {
  int id;
  String ticketUid;
  String title;
  String initialMessage;
  dynamic categoryName;
  DateTime createdAt;
  String statusName;
  int statusId;

  TicketListEntity(
      {required this.id,
      required this.ticketUid,
      required this.title,
      required this.initialMessage,
      required this.categoryName,
      required this.createdAt,
      required this.statusName,
      required this.statusId});
}
