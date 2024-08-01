import 'package:direcrot_mobile_new/features/profile_page/domain/entities/pass_entity.dart';

class PassModel extends PassEntity {
  PassModel(
      {required super.id,
      required super.fullName,
      required super.passTypeId,
      required super.dateTime});

  factory PassModel.fromJson(Map<String, dynamic> json) => PassModel(
        id: json["id"],
        fullName: json["full_name"],
        passTypeId: json["pass_type_id"],
        dateTime: DateTime.parse(json["date_time"]),
      );
}
