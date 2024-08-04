import 'package:direcrot_mobile_new/features/auth/data/models/permission_model.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/permission.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.fullName,
      required super.email,
      required super.phoneNumber,
      required super.iin,
      required super.genderId,
      required super.birthDay,
      required super.token,
      required super.tokenType,
      required super.permissions});

  factory UserModel.fromjson(Map<String, dynamic> map) {
    return UserModel(
        fullName: map['full_name'] ?? '',
        email: map['email'] ?? '',
        phoneNumber: map['phone_number'] ?? '',
        iin: map['iin'],
        genderId: map['gender_id'],
        birthDay: map['birthday'],
        token: map['token'] ?? '',
        tokenType: map['token_type'] ?? '',
        permissions: List<Permission>.from(
            map['permissions'].map((x) => PermissonModel.fromjson(x))));
  }

  UserModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? iin,
    int? genderId,
    String? birthDay,
    String? token,
    String? tokenType,
    List<Permission>? permissions,
  }) {
    return UserModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        iin: iin ?? this.iin,
        genderId: genderId ?? this.genderId,
        birthDay: birthDay ?? this.birthDay,
        token: token ?? this.token,
        tokenType: tokenType ?? this.tokenType,
        permissions: permissions ?? this.permissions);
  }
}
