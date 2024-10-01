class ChatListEntity {
  int id;
  String ticketUid;
  int createdByType;
  String messageBody;
  int orderNum;
  int? evaluation;
  DateTime createdAt;
  String createdByName;
  String? createdByLastName;
  String? createdBySurname;

  ChatListEntity(
      {required this.id,
      required this.ticketUid,
      required this.createdByType,
      required this.messageBody,
      required this.orderNum,
      required this.evaluation,
      required this.createdAt,
      required this.createdByName,
      this.createdByLastName,
      this.createdBySurname});
}
