import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/common/models/contingent_student_model.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';

abstract interface class LgotnikiDataSource {
  Future<List<ContingentStudentModel>> getLgotnikiDataSource(int page);
}

class LgotnikiDataSourceImpl implements LgotnikiDataSource {
  @override
  Future<List<ContingentStudentModel>> getLgotnikiDataSource(int page) async {
    try {
      final response = await DioClient.instance.get(contingentStudent,
          queryParameters: {'page': page, 'isFoodFree': 1});
      List<dynamic> data = response['data'];
      return data
          .map((studentList) => ContingentStudentModel.fromjson(studentList))
          .toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
