import 'dart:io';

import 'package:direcrot_mobile_new/core/common/entities/license_entity.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/main/domain/entities/today_stats.dart';
import 'package:direcrot_mobile_new/features/main/domain/usecases/get_today_stats.dart';
import 'package:direcrot_mobile_new/features/settings/domain/usecase/get_license_data.dart';
import 'package:direcrot_mobile_new/services/local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_events.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetTodayStats _getTodayStats;
  final GetLicenseData _getLicenseData;
  MainBloc(
      {required GetTodayStats getTodayStats,
      required GetLicenseData getLicenseData})
      : _getTodayStats = getTodayStats,
        _getLicenseData = getLicenseData,
        super(const MainState()) {
    on<TodayStatsFetch>(_onFetchTodayStats);
    on<LicenseDataFetch>(_licenseDataFetch);
  }

  void _licenseDataFetch(
      LicenseDataFetch event, Emitter<MainState> emit) async {
    final res = await _getLicenseData(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(
            licenseStatus: LicenseStatus.failure, error: failure.message)),
        (license) => emit(state.copyWith(
            licenseStatus: LicenseStatus.success, license: license)));
  }

  void _onFetchTodayStats(MainEvent event, Emitter<MainState> emit) async {
    final res = await _getTodayStats(NoParams(), null);
    final name = await LocalStorage().readValue('name');
    final schoolName = await LocalStorage().readValue('schoolName');
    String? profileImage = await LocalStorage().readValue('imagePath');
    if (await File(profileImage ?? '').exists()) {
      print('Файл найден: $profileImage');
    } else {
      profileImage = null;
      print('Файл не найден: $profileImage');
    }
    res.fold(
        (l) =>
            emit(state.copyWith(status: MainStatus.failure, error: l.message)),
        (r) => emit(state.copyWith(
            status: MainStatus.success,
            todayStats: r,
            name: name,
            schoolName: schoolName,
            profileImage: profileImage)));
  }
}
