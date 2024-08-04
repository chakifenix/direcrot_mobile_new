import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/devices/data/models/devices_model.dart';

abstract interface class DeviceDataSource {
  Future<List<DevicesModel>> getDevicesDataSource();
}

class DeviceDataSourceImpl implements DeviceDataSource {
  @override
  Future<List<DevicesModel>> getDevicesDataSource() async {
    try {
      final response = await DioClient.instance.get(device);
      List<dynamic> data = response['data'];
      return data
          .map((deviceList) => DevicesModel.fromJson(deviceList))
          .toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
