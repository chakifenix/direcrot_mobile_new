class ChatSendEntity {
  String ticketUid;
  int createdBy;
  int createdByType;
  String messageBody;
  String orderNum;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  ChatSendEntity({
    required this.ticketUid,
    required this.createdBy,
    required this.createdByType,
    required this.messageBody,
    required this.orderNum,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
}
