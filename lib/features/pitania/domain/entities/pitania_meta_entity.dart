import 'package:direcrot_mobile_new/features/pitania/domain/entities/link_entity.dart';

class PitaniaMetaEntity {
  final int currentPage;
  final dynamic from;
  final int lastPage;
  final List<LinkEntity> links;
  final String path;
  final int perPage;
  final dynamic to;
  final int total;

  PitaniaMetaEntity({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });
}
