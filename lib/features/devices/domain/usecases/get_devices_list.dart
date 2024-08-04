import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/devices/domain/entities/devices_entity.dart';
import 'package:direcrot_mobile_new/features/devices/domain/repository/devices_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDevicesList implements UseCase<List<DevicesEntity>, NoParams> {
  final DevicesRepository devicesRepository;
  GetDevicesList(this.devicesRepository);
  @override
  Future<Either<Failure, List<DevicesEntity>>> call(
      NoParams params, String? path) async {
    return await devicesRepository.getDevicesData();
  }
}
