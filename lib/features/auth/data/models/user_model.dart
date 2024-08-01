import 'package:direcrot_mobile_new/features/auth/data/models/permission_model.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/permission.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.fullName,
      required super.email,
      required super.phoneNumber,
      required super.token,
      required super.tokenType,
      required super.permissions});

  factory UserModel.fromjson(Map<String, dynamic> map) {
    return UserModel(
        fullName: map['full_name'] ?? '',
        email: map['email'] ?? '',
        phoneNumber: map['phone_number'] ?? '',
        token: map['token'] ?? '',
        tokenType: map['token_type'] ?? '',
        permissions: List<Permission>.from(
            map['permissions'].map((x) => PermissonModel.fromjson(x))));
  }

  UserModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? token,
    String? tokenType,
    List<Permission>? permissions,
  }) {
    return UserModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        token: token ?? this.token,
        tokenType: tokenType ?? this.tokenType,
        permissions: permissions ?? this.permissions);
  }
}
