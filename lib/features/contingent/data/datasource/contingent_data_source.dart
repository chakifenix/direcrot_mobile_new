import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/contingent/data/model/contingent_gender_model.dart';
import 'package:direcrot_mobile_new/features/contingent/data/model/contingent_model.dart';
import 'package:direcrot_mobile_new/features/contingent/data/model/contingent_personnel.dart';
import 'package:direcrot_mobile_new/features/contingent/data/model/contingent_teacher_model.dart';

abstract interface class ContingentDataSource {
  Future<ContingentModel> getContingentData();
  Future<List<ContingentTeacherModel>> getContingentTeacherModel(int page);
  Future<ContingentGenderModel> getContingentGenderData(
      int gender, String path);
  Future<List<ContingentPersonnelModel>> getContingentPersonnel();
  Future<Map<String, dynamic>> getContingentStudent();
}

class ContingentDataSourceImpl implements ContingentDataSource {
  @override
  Future<ContingentModel> getContingentData() async {
    try {
      final response = await DioClient.instance.get(contingent);
      return ContingentModel.fromjson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<List<ContingentTeacherModel>> getContingentTeacherModel(
      int page) async {
    try {
      final response = await DioClient.instance
          .get(contingentTeacher, queryParameters: {'page': page});
      List<dynamic> data = response['data'];
      return data
          .map((teacherList) => ContingentTeacherModel.fromjson(teacherList))
          .toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<ContingentGenderModel> getContingentGenderData(
      int gender, String path) async {
    try {
      final response = await DioClient.instance
          .get(path, queryParameters: {'gender': gender});
      return ContingentGenderModel.fromjson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<List<ContingentPersonnelModel>> getContingentPersonnel() async {
    try {
      final response = await DioClient.instance.get(contingentPersonnel);
      List<dynamic> data = response['data'];
      return data
          .map((personnelList) =>
              ContingentPersonnelModel.fromjson(personnelList))
          .toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<Map<String, dynamic>> getContingentStudent() async {
    try {
      final response = await DioClient.instance.get(contingentStudent);
      return response;
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
