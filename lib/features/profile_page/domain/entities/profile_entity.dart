class ProfileEntity {
  final String fullName;
  final String iin;
  final int genderId;
  final String position;
  final String specialty;
  final String birthday;
  final String ataFio;
  final dynamic ataLastVisit;
  final String ataMobile;
  final String anaFio;
  final String anaLastVisit;
  final String anaMobile;
  final String teacherFio;
  final String? lastVisit;
  final String online;

  ProfileEntity(
      {required this.fullName,
      required this.iin,
      required this.genderId,
      required this.position,
      required this.specialty,
      required this.birthday,
      required this.ataFio,
      required this.ataLastVisit,
      required this.ataMobile,
      required this.anaFio,
      required this.anaLastVisit,
      required this.anaMobile,
      required this.teacherFio,
      required this.lastVisit,
      required this.online});
}
