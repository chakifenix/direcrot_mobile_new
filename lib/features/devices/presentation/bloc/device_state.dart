part of 'device_bloc.dart';

enum DeviceStatus { initial, loading, success, failure }

class DeviceState extends Equatable {
  final DeviceStatus status;
  final List<DevicesEntity> deviceList;
  final String? error;

  const DeviceState(
      {this.status = DeviceStatus.initial,
      this.deviceList = const [],
      this.error});

  @override
  List<Object?> get props => [status, deviceList, error];

  bool get isInitial => status == DeviceStatus.initial;
  bool get isLoading => status == DeviceStatus.loading;
  bool get isSuccess => status == DeviceStatus.success;
  bool get isFailure => status == DeviceStatus.failure;

  DeviceState copyWith({
    DeviceStatus? status,
    List<DevicesEntity>? deviceList,
    String? error,
  }) {
    return DeviceState(
        status: status ?? this.status,
        deviceList: deviceList ?? this.deviceList,
        error: error ?? this.error);
  }
}
