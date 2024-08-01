import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/common/models/license_model.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/main/data/model/today_stats_model.dart';

abstract interface class MainDataSource {
  Future<TodayStatsModel> getTodayStats();
  Future<LicenseModel> getLicense();
}

class MainDataSourceImpl implements MainDataSource {
  @override
  Future<TodayStatsModel> getTodayStats() async {
    try {
      final response = await DioClient.instance.get(todayAnalytics);
      return TodayStatsModel.fromjson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<LicenseModel> getLicense() async {
    try {
      final response = await DioClient.instance.get(license);
      return LicenseModel.fromJson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
