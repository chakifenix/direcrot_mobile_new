import 'package:direcrot_mobile_new/features/skud/domain/entities/skud_entity.dart';

class SkudModel extends SkudEntity {
  SkudModel(
      {required super.id,
      required super.surname,
      required super.name,
      required super.patronymic,
      required super.uid,
      required super.position,
      required super.passTypeId,
      required super.dateTime,
      required super.genderId});

  factory SkudModel.fromjson(Map<String, dynamic> json) => SkudModel(
        id: json["id"] ?? '',
        surname: json["surname"] ?? '',
        name: json["name"] ?? '',
        patronymic: json["patronymic"] ?? '',
        uid: json["uid"] ?? '',
        position: json["position"] ?? '',
        passTypeId: json["pass_type_id"] ?? '',
        dateTime: DateTime.parse(json["date_time"]),
        genderId: json["gender_id"] ?? '',
      );
}
