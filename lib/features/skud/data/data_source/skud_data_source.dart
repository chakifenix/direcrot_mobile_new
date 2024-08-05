import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/exceptions.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/skud/data/models/skud_model.dart';

abstract interface class SkudDataSource {
  Future<List<SkudModel>> getAllSkudList(
      int page, int? passType, String? dateFrom, String? dateTo);
}

class SkudDataSourceImpl implements SkudDataSource {
  @override
  Future<List<SkudModel>> getAllSkudList(
      int page, int? passType, String? dateFrom, String? dateTo) async {
    try {
      final response = await DioClient.instance.get(skud, queryParameters: {
        'page': page,
        'pass_type_id': passType,
        'from': dateFrom,
        'to': dateTo
      });
      List<dynamic> data = response['data'];
      return data.map((skudList) => SkudModel.fromjson(skudList)).toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }
}
