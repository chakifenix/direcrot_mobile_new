import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/devices/domain/entities/devices_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DevicesRepository {
  Future<Either<Failure, List<DevicesEntity>>> getDevicesData();
}
