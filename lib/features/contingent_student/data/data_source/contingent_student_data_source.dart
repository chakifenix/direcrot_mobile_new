import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/core/common/models/contingent_student_gender_model.dart';
import 'package:direcrot_mobile_new/core/common/models/contingent_student_model.dart';

abstract interface class ContingentStudentDataSource {
  Future<List<ContingentStudentModel>> getContingentStudentDataSource(int page);
  Future<ContingentStudentGenderModel> getContingentStudentGenderData();
}

class ContingentStudentDataSourceImpl implements ContingentStudentDataSource {
  @override
  Future<List<ContingentStudentModel>> getContingentStudentDataSource(
      int page) async {
    try {
      final response = await DioClient.instance
          .get(contingentStudent, queryParameters: {'page': page});
      List<dynamic> data = response['data'];
      return data
          .map((studentList) => ContingentStudentModel.fromjson(studentList))
          .toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<ContingentStudentGenderModel> getContingentStudentGenderData() async {
    try {
      final response = await DioClient.instance
          .get(contingentStudent, queryParameters: {'genders': 1});
      return ContingentStudentGenderModel.fromjson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
