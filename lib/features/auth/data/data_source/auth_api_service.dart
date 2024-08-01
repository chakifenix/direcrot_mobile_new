import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/auth/data/models/iin_answer_model.dart';
import 'package:direcrot_mobile_new/features/auth/data/models/user_model.dart';

abstract interface class AuthApiService {
  Future<IinAnswerModel> loginWithIIN({required String iin});
  Future<UserModel> loginWithSms({required String code, required String iin});
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<IinAnswerModel> loginWithIIN({required String iin}) async {
    try {
      final response =
          await DioClient.instance.post(loginIin, data: {'iin': iin});
      return IinAnswerModel.fromjson(response);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<UserModel> loginWithSms(
      {required String code, required String iin}) async {
    try {
      final response = await DioClient.instance
          .post(loginSms, data: {'code': code, 'iin': iin});
      return UserModel.fromjson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
