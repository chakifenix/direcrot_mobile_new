import 'package:direcrot_mobile_new/features/profile_page/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel(
      {required super.fullName,
      required super.iin,
      required super.genderId,
      required super.position,
      required super.specialty,
      required super.birthday,
      required super.ataFio,
      required super.ataLastVisit,
      required super.ataMobile,
      required super.anaFio,
      required super.anaLastVisit,
      required super.anaMobile,
      required super.teacherFio,
      required super.lastVisit,
      required super.online});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      fullName: json["full_name"] ?? '',
      iin: json["iin"] ?? '',
      genderId: json['gender_id'],
      position: json["position"] ?? '',
      specialty: json["specialty"] ?? '',
      birthday: json["birthday"] ?? '',
      ataFio: json["ata_fio"] ?? '',
      ataLastVisit: json["ata_last_visit"] ?? '',
      ataMobile: json["ata_mobile"] ?? '',
      anaFio: json["ana_fio"] ?? '',
      anaLastVisit: json["ana_last_visit"] ?? '',
      anaMobile: json["ana_mobile"] ?? '',
      teacherFio: json["teacher_fio"] ?? '',
      lastVisit: json['last_visit'] ?? '',
      online: json['online']);

  ProfileModel copyWith(
          {String? fullName,
          String? iin,
          int? genderId,
          String? position,
          String? specialty,
          String? birthday,
          String? ataFio,
          dynamic ataLastVisit,
          String? ataMobile,
          String? anaFio,
          String? anaLastVisit,
          String? anaMobile,
          String? teacherFio,
          String? lastVisit,
          String? online}) =>
      ProfileModel(
          fullName: fullName ?? this.fullName,
          iin: iin ?? this.iin,
          genderId: genderId ?? this.genderId,
          position: position ?? this.position,
          specialty: specialty ?? this.specialty,
          birthday: birthday ?? this.birthday,
          ataFio: ataFio ?? this.ataFio,
          ataLastVisit: ataLastVisit ?? this.ataLastVisit,
          ataMobile: ataMobile ?? this.ataMobile,
          anaFio: anaFio ?? this.anaFio,
          anaLastVisit: anaLastVisit ?? this.anaLastVisit,
          anaMobile: anaMobile ?? this.anaMobile,
          teacherFio: teacherFio ?? this.teacherFio,
          lastVisit: lastVisit ?? this.lastVisit,
          online: online ?? this.online);
}
