import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';

class LicenseModel extends LicenseEntity {
  LicenseModel(
      {required super.id,
      required super.mektepId,
      required super.owner,
      required super.license,
      required super.status,
      required super.dateCreated,
      required super.dateExpire,
      required super.dateUpadate});

  factory LicenseModel.fromJson(Map<String, dynamic> json) => LicenseModel(
        id: json["id"] ?? 0,
        mektepId: json["mektep_id"] ?? 0,
        owner: json["owner"] ?? '',
        license: json["license"] ?? '',
        status: json["status"] ?? 0,
        dateCreated: DateTime.parse(json["date_created"]),
        dateExpire: DateTime.parse(json["date_expire"]),
        dateUpadate: DateTime.parse(json["date_upadate"]),
      );
}
