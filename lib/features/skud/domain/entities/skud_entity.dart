class SkudEntity {
  final int id;
  final String surname;
  final String name;
  final String patronymic;
  final int uid;
  final String position;
  final int passTypeId;
  final DateTime dateTime;
  final int genderId;

  SkudEntity({
    required this.id,
    required this.surname,
    required this.name,
    required this.patronymic,
    required this.uid,
    required this.position,
    required this.passTypeId,
    required this.dateTime,
    required this.genderId,
  });
}
