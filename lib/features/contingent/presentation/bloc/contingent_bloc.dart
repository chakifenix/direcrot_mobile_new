import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_gender.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_personnel.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/entities/contingent_teacher.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/usecases/get_contingent_data.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/usecases/get_contingent_personnel_data.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/usecases/get_contingent_teacher_data.dart';
import 'package:direcrot_mobile_new/features/contingent/domain/usecases/get_contingent_teacher_gender.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contingent_events.dart';
part 'contingent_state.dart';

class ContingentBloc extends Bloc<ContingentEvent, ContingentState> {
  final GetContingentData _getContingentData;
  final GetContingentTeacherData _getContingentTeacherData;
  final GetContingentTeacherGender _getContingentTeacherGender;
  final GetContingentPersonnelData _getContingentPersonnelData;
  ContingentBloc({
    required GetContingentData getContingentData,
    required GetContingentTeacherData getContingentTeacherData,
    required GetContingentTeacherGender getContingentTeacherGender,
    required GetContingentPersonnelData getContingentPersonnelData,
  })  : _getContingentData = getContingentData,
        _getContingentTeacherData = getContingentTeacherData,
        _getContingentTeacherGender = getContingentTeacherGender,
        _getContingentPersonnelData = getContingentPersonnelData,
        super(const ContingentState()) {
    on<ContingentDataFetch>(_onFetchContingent);
    on<ContingentTeacherDataFetch>(_onFetchContingentTeacher);
    on<ContingentGenderFetch>(_onFetchContingentTeacherGender);
    on<ContingentPersonnelDataFetch>(_onFetchContingentPersonnel);
  }

  void _onFetchContingent(
      ContingentDataFetch event, Emitter<ContingentState> emit) async {
    emit(state.copyWith(status: ContingentStatus.loading));
    final res = await _getContingentData(NoParams(), null);
    res.fold((failure) {
      emit(state.copyWith(
          status: ContingentStatus.failure, error: failure.message));
    }, (contingent) {
      emit(state.copyWith(
          status: ContingentStatus.success, contingentData: contingent));
    });
  }

  void _onFetchContingentTeacher(
      ContingentTeacherDataFetch event, Emitter<ContingentState> emit) async {
    if (state.isPaginationLoading) return;
    emit(state.copyWith(isPaginationLoading: true));
    final page = event.page ?? state.page;
    print("----Pagination page: ${page} ");
    final res = await _getContingentTeacherData(
        ContingentTeacherParams(page: page), null);
    res.fold(
        (failure) => emit(state.copyWith(
            isPaginationLoading: false,
            contingentTeacherStatus: ContingentTeacherStatus.failure,
            error: failure.message)), (contingent) {
      final List<ContingentTeacher> answer = page == 1
          ? contingent
          : (List.of(state.teacherListResponse)..addAll(contingent));
      emit(state.copyWith(
          page: page + 1,
          isPaginationLoading: false,
          contingentTeacherStatus: ContingentTeacherStatus.success,
          contingentTeacher: contingent,
          teacherListResponse: answer));
    });
  }

  void _onFetchContingentTeacherGender(
      ContingentGenderFetch event, Emitter<ContingentState> emit) async {
    emit(
        state.copyWith(contingentGenderStatus: ContingentGenderStatus.initial));
    final res = await _getContingentTeacherGender(
        ContingentGenderParams(gender: 1), event.path);
    res.fold(
        (failure) => emit(state.copyWith(
            contingentTeacherStatus: ContingentTeacherStatus.failure,
            error: failure.message)),
        (contingentGender) => emit(state.copyWith(
            contingentGenderStatus: ContingentGenderStatus.success,
            contingentGenderData: contingentGender)));
  }

  void _onFetchContingentPersonnel(
      ContingentPersonnelDataFetch event, Emitter<ContingentState> emit) async {
    final res = await _getContingentPersonnelData(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(
            contingentPersonnelStatus: ContingentPersonnelStatus.failure,
            error: failure.message)), (contingent) {
      emit(state.copyWith(
          contingentPersonnelStatus: ContingentPersonnelStatus.success,
          contingentPersonnel: contingent));
    });
  }
}
