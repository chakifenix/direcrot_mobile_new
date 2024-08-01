import 'package:direcrot_mobile_new/features/auth/domain/entities/connection.dart';

class Permission {
  Permission({required this.connection, required this.role});
  Connection connection;
  Connection role;
}
