import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_gender.dart';

class ContingentGenderModel extends ContingentGender {
  const ContingentGenderModel({
    required super.maleCount,
    required super.femaleCount,
  });

  factory ContingentGenderModel.fromjson(Map<String, dynamic> map) {
    return ContingentGenderModel(
        maleCount: map['male_count'], femaleCount: map['female_count']);
  }

  ContingentGenderModel copyWith({int? maleCount, int? femaleCount}) {
    return ContingentGenderModel(
        maleCount: maleCount ?? this.maleCount,
        femaleCount: femaleCount ?? this.femaleCount);
  }
}
