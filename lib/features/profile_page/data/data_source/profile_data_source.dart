import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/profile_page/data/models/pass_model.dart';
import 'package:direcrot_mobile_new/features/profile_page/data/models/profile_model.dart';

abstract interface class ProfileDataSource {
  Future<ProfileModel> getProfileData(int id);
  Future<List<PassModel>> getPassData(int id);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<ProfileModel> getProfileData(int id) async {
    try {
      final response = await DioClient.instance.get('$contingent/$id');
      return ProfileModel.fromJson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<List<PassModel>> getPassData(int id) async {
    try {
      final response =
          await DioClient.instance.get('$contingent/$id/pass-history');
      List<dynamic> data = response['data'];
      return data.map((passList) => PassModel.fromJson(passList)).toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
