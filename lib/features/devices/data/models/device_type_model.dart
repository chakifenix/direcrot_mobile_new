import 'package:direcrot_mobile_new/features/devices/domain/entities/device_type_entity.dart';

class DeviceTypeModel extends DeviceTypeEntity {
  DeviceTypeModel(
      {required super.id,
      required super.nameKk,
      required super.nameRu,
      required super.operation,
      required super.createdAt,
      required super.updatedAt});

  factory DeviceTypeModel.fromJson(Map<String, dynamic> json) =>
      DeviceTypeModel(
        id: json["id"],
        nameKk: json["name_kk"],
        nameRu: json["name_ru"],
        operation: json["operation"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
