import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';
import 'package:direcrot_mobile_new/core/common/entities/contingent_student_gender.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/usecases/get_contingent_student_data.dart';
import 'package:direcrot_mobile_new/features/contingent_student/domain/usecases/get_contingent_student_gender_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contingent_student_events.dart';
part 'contingent_student_state.dart';

class ContingentStudentBloc
    extends Bloc<ContingentStudentEvent, ContingentStudentState> {
  final GetContingentStudentData _getContingentStudentData;
  final GetContingentStudentGenderData _getContingentStudentGenderData;
  ContingentStudentBloc(
      {required GetContingentStudentData getContingentStudentData,
      required GetContingentStudentGenderData getContingentStudentGenderData})
      : _getContingentStudentData = getContingentStudentData,
        _getContingentStudentGenderData = getContingentStudentGenderData,
        super(const ContingentStudentState()) {
    on<ContingentStudentDataFetch>(_onFetchContingentStudent);
    on<ContingentStudentGenderFetch>(_onFetchContingentStudentGender);
  }

  void _onFetchContingentStudent(ContingentStudentDataFetch event,
      Emitter<ContingentStudentState> emit) async {
    if (state.isPaginationLoading) return;
    emit(state.copyWith(isPaginationLoading: true));
    final page = event.page ?? state.page;
    print("----Pagination page: ${page} ");
    final res = await _getContingentStudentData(
        ContingentStudentParams(page: page), null);
    res.fold(
        (failure) => emit(state.copyWith(
              isPaginationLoading: false,
              status: ContingentStudentStatus.failure,
              error: failure.message,
            )), (studentList) {
      final List<ContingentStudent> answer = page == 1
          ? studentList
          : (List.of(state.studentListResponse)..addAll(studentList));
      emit(state.copyWith(
        page: page + 1,
        isPaginationLoading: false,
        status: ContingentStudentStatus.success,
        contingentStudent: studentList,
        studentListResponse: answer,
      ));
    });
  }

  void _onFetchContingentStudentGender(ContingentStudentGenderFetch event,
      Emitter<ContingentStudentState> emit) async {
    final res = await _getContingentStudentGenderData(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(
              genderStatus: ContingentStudentGenderStatus.failure,
            )),
        (gender) => emit(state.copyWith(
            genderStatus: ContingentStudentGenderStatus.success,
            gender: gender)));
  }
}
