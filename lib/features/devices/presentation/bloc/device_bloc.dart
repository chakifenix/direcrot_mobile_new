import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/devices/domain/entities/devices_entity.dart';
import 'package:direcrot_mobile_new/features/devices/domain/usecases/get_devices_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'device_events.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final GetDevicesList _getDevicesList;
  DeviceBloc({required GetDevicesList getDevicesList})
      : _getDevicesList = getDevicesList,
        super(const DeviceState()) {
    on<DeviceListFetch>(_onDeviceListFetch);
  }

  void _onDeviceListFetch(
      DeviceListFetch event, Emitter<DeviceState> emit) async {
    final res = await _getDevicesList(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: DeviceStatus.failure, error: failure.message)),
        (deviceList) => emit(state.copyWith(
            status: DeviceStatus.success, deviceList: deviceList)));
  }
}
