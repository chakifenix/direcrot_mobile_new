import 'package:direcrot_mobile_new/features/auth/data/models/connection_model.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/connection.dart';
import 'package:direcrot_mobile_new/features/auth/domain/entities/permission.dart';

class PermissonModel extends Permission {
  PermissonModel({required super.connection, required super.role});

  factory PermissonModel.fromjson(Map<String, dynamic> map) {
    return PermissonModel(
        connection: ConnectionModel.fromjson(map['connection']),
        role: ConnectionModel.fromjson(map['role']));
  }

  PermissonModel copyWith({
    Connection? connection,
    Connection? role,
  }) {
    return PermissonModel(
      connection: connection ?? this.connection,
      role: role ?? this.role,
    );
  }
}
