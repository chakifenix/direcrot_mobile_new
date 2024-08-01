import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/core/common/models/license_model.dart';

abstract interface class SettingsDataSource {
  Future<String> updatePhoneNumber({required String phoneNumber});
  Future<LicenseModel> getLicenseData();
}

class SettingsDataSourceImpl implements SettingsDataSource {
  @override
  Future<String> updatePhoneNumber({required String phoneNumber}) async {
    try {
      final response =
          await DioClient.instance.put(phone, data: {'phone': phoneNumber});
      return response['data'];
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<LicenseModel> getLicenseData() async {
    try {
      final response = await DioClient.instance.get(license);
      return LicenseModel.fromJson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
