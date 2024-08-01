import 'package:direcrot_mobile_new/features/pitania/data/models/link_model.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/link_entity.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_meta_entity.dart';

class PitaniaMetaModel extends PitaniaMetaEntity {
  PitaniaMetaModel(
      {required super.currentPage,
      required super.from,
      required super.lastPage,
      required super.links,
      required super.path,
      required super.perPage,
      required super.to,
      required super.total});

  factory PitaniaMetaModel.fromJson(Map<String, dynamic> json) =>
      PitaniaMetaModel(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<LinkEntity>.from(
            json["links"].map((x) => LinkModel.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );
}
