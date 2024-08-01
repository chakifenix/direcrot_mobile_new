import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_entity.dart';

class PitaniaModel extends PitaniaEntity {
  PitaniaModel(
      {required super.id,
      required super.surname,
      required super.name,
      required super.patronymic,
      required super.position,
      required super.dateDiff,
      required super.date,
      required super.dateTime,
      required super.time,
      required super.uid});

  factory PitaniaModel.fromJson(Map<String, dynamic> json) => PitaniaModel(
      id: json["id"] ?? '',
      surname: json["surname"] ?? '',
      name: json["name"] ?? '',
      patronymic: json["patronymic"] ?? '',
      position: json["position"] ?? '',
      dateDiff: json["date_diff"] ?? '',
      date: DateTime.parse(json["date"]),
      dateTime: DateTime.parse(json["date_time"]),
      time: json["time"] ?? '',
      uid: json["uid"]);
}
