import 'package:direcrot_mobile_new/features/auth/domain/entities/permission.dart';

class User {
  User(
      {required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.iin,
      required this.genderId,
      required this.birthDay,
      required this.token,
      required this.tokenType,
      required this.permissions});

  String fullName;
  String email;
  String phoneNumber;
  String iin;
  int genderId;
  String birthDay;
  String token;
  String tokenType;
  List<Permission> permissions;
}
