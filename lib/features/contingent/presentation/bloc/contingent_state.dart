part of 'contingent_bloc.dart';

enum ContingentStatus { initial, loading, success, failure }

enum ContingentTeacherStatus { initial, loading, success, failure }

enum ContingentGenderStatus { initial, loading, success, failure }

enum ContingentPersonnelStatus { initial, loading, success, failure }

class ContingentState extends Equatable {
  final ContingentStatus status;
  final ContingentTeacherStatus contingentTeacherStatus;
  final ContingentGenderStatus contingentGenderStatus;
  final ContingentPersonnelStatus contingentPersonnelStatus;
  final int page;
  final bool isPaginationLoading;
  final String? error;
  final Contingent? contingentData;
  final List<ContingentTeacher>? contingentTeacher;
  final List<ContingentTeacher> teacherListResponse;
  final List<ContingentPersonnel> contingentPersonnel;
  final ContingentGender? contingentGenderData;

  const ContingentState(
      {this.status = ContingentStatus.initial,
      this.contingentTeacherStatus = ContingentTeacherStatus.initial,
      this.contingentGenderStatus = ContingentGenderStatus.initial,
      this.contingentPersonnelStatus = ContingentPersonnelStatus.initial,
      this.page = 1,
      this.isPaginationLoading = false,
      this.error,
      this.contingentData,
      this.contingentTeacher,
      this.teacherListResponse = const [],
      this.contingentPersonnel = const [],
      this.contingentGenderData});

  @override
  List<Object?> get props => [
        status,
        contingentTeacherStatus,
        contingentGenderStatus,
        contingentPersonnelStatus,
        isPaginationLoading,
        error,
        contingentData,
        contingentTeacher,
        teacherListResponse,
        contingentPersonnel,
        contingentGenderData
      ];

  bool get isInitial => status == ContingentStatus.initial;
  bool get isLoading => status == ContingentStatus.loading;
  bool get isSuccess => status == ContingentStatus.success;
  bool get isFailure => status == ContingentStatus.failure;

  bool get isTeacherInitial =>
      contingentTeacherStatus == ContingentTeacherStatus.initial;
  bool get isTeacherLoading =>
      contingentTeacherStatus == ContingentTeacherStatus.loading;
  bool get isTeacherSuccess =>
      contingentTeacherStatus == ContingentTeacherStatus.success;
  bool get isTeacherFailure =>
      contingentTeacherStatus == ContingentTeacherStatus.failure;

  bool get isGenderInitial =>
      contingentGenderStatus == ContingentGenderStatus.initial;
  bool get isGenderLoading =>
      contingentGenderStatus == ContingentGenderStatus.loading;
  bool get isGenderSuccess =>
      contingentGenderStatus == ContingentGenderStatus.success;
  bool get isGenderFailure =>
      contingentGenderStatus == ContingentGenderStatus.failure;

  bool get isPersonnelInitial =>
      contingentPersonnelStatus == ContingentPersonnelStatus.initial;
  bool get isPersonnelLoading =>
      contingentPersonnelStatus == ContingentPersonnelStatus.loading;
  bool get isPersonnelSuccess =>
      contingentPersonnelStatus == ContingentPersonnelStatus.success;
  bool get isPersonnelFailure =>
      contingentPersonnelStatus == ContingentPersonnelStatus.failure;

  ContingentState copyWith(
      {ContingentStatus? status,
      ContingentTeacherStatus? contingentTeacherStatus,
      ContingentGenderStatus? contingentGenderStatus,
      ContingentPersonnelStatus? contingentPersonnelStatus,
      int? page,
      bool? isPaginationLoading,
      String? error,
      Contingent? contingentData,
      List<ContingentTeacher>? contingentTeacher,
      List<ContingentTeacher>? teacherListResponse,
      List<ContingentPersonnel>? contingentPersonnel,
      List? studentKontingentModel,
      ContingentGender? contingentGenderData}) {
    return ContingentState(
        status: status ?? this.status,
        contingentTeacherStatus:
            contingentTeacherStatus ?? this.contingentTeacherStatus,
        contingentGenderStatus:
            contingentGenderStatus ?? this.contingentGenderStatus,
        contingentPersonnelStatus:
            contingentPersonnelStatus ?? this.contingentPersonnelStatus,
        page: page ?? this.page,
        isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
        error: error ?? this.error,
        contingentData: contingentData ?? this.contingentData,
        contingentTeacher: contingentTeacher ?? this.contingentTeacher,
        teacherListResponse: teacherListResponse ?? this.teacherListResponse,
        contingentPersonnel: contingentPersonnel ?? this.contingentPersonnel,
        contingentGenderData:
            contingentGenderData ?? this.contingentGenderData);
  }
}
