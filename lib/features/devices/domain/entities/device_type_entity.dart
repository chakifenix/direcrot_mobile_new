class DeviceTypeEntity {
  int id;
  String nameKk;
  String nameRu;
  dynamic operation;
  DateTime createdAt;
  DateTime updatedAt;

  DeviceTypeEntity({
    required this.id,
    required this.nameKk,
    required this.nameRu,
    required this.operation,
    required this.createdAt,
    required this.updatedAt,
  });
}
