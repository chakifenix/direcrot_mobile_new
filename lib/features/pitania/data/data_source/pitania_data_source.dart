import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/pitania/data/models/pitania_meta_model.dart';
import 'package:direcrot_mobile_new/features/pitania/data/models/pitania_model.dart';

abstract interface class PitaniaDataSource {
  Future<List<PitaniaModel>> getAllPitaniaList(int page);
  Future<PitaniaMetaModel> getPitaniaCount(
      int? isFoodFree, int? classAt, int? classTo);
}

class PitaniaDataSourceImpl implements PitaniaDataSource {
  @override
  Future<List<PitaniaModel>> getAllPitaniaList(int page) async {
    try {
      final response = await DioClient.instance
          .get(pitania, queryParameters: {'page': page});
      List<dynamic> data = response['data'];
      return data
          .map((pitaniaList) => PitaniaModel.fromJson(pitaniaList))
          .toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<PitaniaMetaModel> getPitaniaCount(
      int? isFoodFree, int? classAt, int? classTo) async {
    try {
      final response = await DioClient.instance.get(contingentStudent,
          queryParameters: {
            'isFoodFree': isFoodFree,
            'classAt': classAt,
            'classTo': classTo
          });
      return PitaniaMetaModel.fromJson(response['meta']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
