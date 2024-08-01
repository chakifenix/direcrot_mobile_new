import 'package:direcrot_mobile_new/features/pitania/domain/entities/link_entity.dart';

class LinkModel extends LinkEntity {
  LinkModel({required super.url, required super.label, required super.active});

  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        url: json["url"] ?? '',
        label: json["label"] ?? '',
        active: json["active"] ?? '',
      );
}
