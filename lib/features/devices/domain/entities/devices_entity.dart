import 'package:direcrot_mobile_new/features/devices/domain/entities/device_type_entity.dart';

class DevicesEntity {
  int id;
  String name;
  String serialNo;
  int typeId;
  String params;
  dynamic operation;
  DateTime updatedAt;
  DateTime createdAt;
  int? status;
  DateTime? logTime;
  DeviceTypeEntity? deviceType;

  DevicesEntity({
    required this.id,
    required this.name,
    required this.serialNo,
    required this.typeId,
    required this.params,
    required this.operation,
    required this.updatedAt,
    required this.createdAt,
    required this.status,
    required this.logTime,
    required this.deviceType,
  });
}
