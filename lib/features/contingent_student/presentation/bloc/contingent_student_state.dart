part of 'contingent_student_bloc.dart';

enum ContingentStudentStatus { initial, loading, success, failure }

enum ContingentStudentGenderStatus { initial, loading, success, failure }

class ContingentStudentState extends Equatable {
  final ContingentStudentStatus status;
  final ContingentStudentGenderStatus genderStatus;
  final int page;
  final bool isPaginationLoading;
  final List<ContingentStudent>? contingentStudent;
  final List<ContingentStudent> studentListResponse;
  final ContingentStudentGender? gender;
  final String? error;

  const ContingentStudentState(
      {this.status = ContingentStudentStatus.initial,
      this.genderStatus = ContingentStudentGenderStatus.initial,
      this.page = 1,
      this.isPaginationLoading = false,
      this.contingentStudent,
      this.studentListResponse = const [],
      this.gender,
      this.error});

  @override
  List<Object?> get props => [
        status,
        genderStatus,
        page,
        isPaginationLoading,
        contingentStudent,
        studentListResponse,
        gender,
        error
      ];

  bool get isInitial => status == ContingentStudentStatus.initial;
  bool get isLoading => status == ContingentStudentStatus.loading;
  bool get isSuccess => status == ContingentStudentStatus.success;
  bool get isFailure => status == ContingentStudentStatus.failure;

  bool get isGenderInitial =>
      genderStatus == ContingentStudentGenderStatus.initial;
  bool get isGenderLoading =>
      genderStatus == ContingentStudentGenderStatus.loading;
  bool get isGenderSuccess =>
      genderStatus == ContingentStudentGenderStatus.success;
  bool get isGenderFailure =>
      genderStatus == ContingentStudentGenderStatus.failure;

  ContingentStudentState copyWith(
      {ContingentStudentStatus? status,
      ContingentStudentGenderStatus? genderStatus,
      int? page,
      bool? isPaginationLoading,
      List<ContingentStudent>? contingentStudent,
      List<ContingentStudent>? studentListResponse,
      ContingentStudentGender? gender,
      String? error}) {
    return ContingentStudentState(
        status: status ?? this.status,
        genderStatus: genderStatus ?? this.genderStatus,
        page: page ?? this.page,
        isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
        contingentStudent: contingentStudent ?? this.contingentStudent,
        studentListResponse: studentListResponse ?? this.studentListResponse,
        gender: gender ?? this.gender,
        error: error ?? this.error);
  }
}
