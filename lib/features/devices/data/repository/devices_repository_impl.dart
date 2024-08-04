import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/devices/data/data_source/device_data_source.dart';
import 'package:direcrot_mobile_new/features/devices/domain/entities/devices_entity.dart';
import 'package:direcrot_mobile_new/features/devices/domain/repository/devices_repository.dart';
import 'package:fpdart/fpdart.dart';

class DevicesRepositoryImpl implements DevicesRepository {
  final DeviceDataSource deviceDataSource;
  DevicesRepositoryImpl(this.deviceDataSource);
  @override
  Future<Either<Failure, List<DevicesEntity>>> getDevicesData() async {
    return _getDevicesData(
        () async => await deviceDataSource.getDevicesDataSource());
  }

  Future<Either<Failure, List<DevicesEntity>>> _getDevicesData(
      Future<List<DevicesEntity>> Function() fn) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
