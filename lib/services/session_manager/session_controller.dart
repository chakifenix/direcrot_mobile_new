import 'package:direcrot_mobile_new/features/auth/domain/entities/user.dart';
import 'package:direcrot_mobile_new/services/local_storage.dart';

class SessionController {
  final LocalStorage localStorage = LocalStorage();

  Future<void> saveUserData(User? user) async {
    localStorage.setValue('name', user?.fullName ?? '');
    localStorage.setValue('email', user?.email ?? '');
    localStorage.setValue('phoneNumber', user?.phoneNumber ?? '');
    localStorage.setValue('token', user?.token ?? '');
    localStorage.setValue('tokenType', user?.tokenType ?? '');
    localStorage.setValue(
        'connectionId', user?.permissions[0].connection.id.toString() ?? '');
    localStorage.setValue(
        'schoolName', user?.permissions[0].connection.name ?? '');
    localStorage.setValue(
        'roleId', user?.permissions[0].role.id.toString() ?? '');
  }

  Future<void> saveUserImage(String userImage) async {
    localStorage.setValue('imagePath', userImage);
  }

  Future<void> savePhoneNumber(String phoneNumber) async {
    localStorage.setValue('phoneNumber', phoneNumber);
  }
}
