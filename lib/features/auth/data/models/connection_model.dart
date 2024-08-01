import 'package:direcrot_mobile_new/features/auth/domain/entities/connection.dart';

class ConnectionModel extends Connection {
  ConnectionModel({required super.id, required super.name});

  factory ConnectionModel.fromjson(Map<String, dynamic> map) {
    return ConnectionModel(id: map['id'], name: map['name']);
  }
}
