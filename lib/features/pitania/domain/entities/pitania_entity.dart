class PitaniaEntity {
  int id;
  String surname;
  String name;
  String patronymic;
  String position;
  String dateDiff;
  DateTime date;
  DateTime dateTime;
  String time;
  int uid;

  PitaniaEntity(
      {required this.id,
      required this.surname,
      required this.name,
      required this.patronymic,
      required this.position,
      required this.dateDiff,
      required this.date,
      required this.dateTime,
      required this.time,
      required this.uid});
}
