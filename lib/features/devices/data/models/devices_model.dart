import 'package:direcrot_mobile_new/features/devices/data/models/device_type_model.dart';
import 'package:direcrot_mobile_new/features/devices/domain/entities/devices_entity.dart';

class DevicesModel extends DevicesEntity {
  DevicesModel(
      {required super.id,
      required super.name,
      required super.serialNo,
      required super.typeId,
      required super.params,
      required super.operation,
      required super.updatedAt,
      required super.createdAt,
      required super.status,
      required super.logTime,
      required super.deviceType});

  factory DevicesModel.fromJson(Map<String, dynamic> json) => DevicesModel(
        id: json["id"],
        name: json["name"],
        serialNo: json["serial_no"],
        typeId: json["type_id"],
        params: json["params"],
        operation: json["operation"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        status: json["status"],
        logTime:
            json["log_time"] == null ? null : DateTime.parse(json["log_time"]),
        deviceType: json["device_type"] == null
            ? null
            : DeviceTypeModel.fromJson(json["device_type"]),
      );
}
