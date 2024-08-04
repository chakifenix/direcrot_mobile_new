part of 'lgotniki_bloc.dart';

enum LgotnikiStatus { initial, loading, success, failure }

enum LgotnikiGenderStatus { initial, loading, success, failure }

class LgotnikiState extends Equatable {
  final LgotnikiStatus status;
  final LgotnikiGenderStatus genderStatus;
  final int page;
  final bool isPaginationLoading;
  final List<ContingentStudent>? lgotnikiList;
  final List<ContingentStudent> lgotnikiResponse;
  final ContingentStudentGender? genderCount;
  final String? error;

  const LgotnikiState(
      {this.status = LgotnikiStatus.initial,
      this.genderStatus = LgotnikiGenderStatus.initial,
      this.page = 1,
      this.isPaginationLoading = false,
      this.lgotnikiList,
      this.lgotnikiResponse = const [],
      this.genderCount,
      this.error});

  @override
  List<Object?> get props => [
        status,
        genderStatus,
        page,
        isPaginationLoading,
        lgotnikiList,
        lgotnikiResponse,
        genderCount,
        error
      ];

  bool get isInitial => status == LgotnikiStatus.initial;
  bool get isLoading => status == LgotnikiStatus.loading;
  bool get isSuccess => status == LgotnikiStatus.success;
  bool get isFailure => status == LgotnikiStatus.failure;

  bool get isGenderInitial => genderStatus == LgotnikiGenderStatus.initial;
  bool get isGenderLoading => genderStatus == LgotnikiGenderStatus.loading;
  bool get isGenderSuccess => genderStatus == LgotnikiGenderStatus.success;
  bool get isGenderFailure => genderStatus == LgotnikiGenderStatus.failure;

  LgotnikiState copyWith(
      {LgotnikiStatus? status,
      LgotnikiGenderStatus? genderStatus,
      int? page,
      bool? isPaginationLoading,
      List<ContingentStudent>? lgotnikiList,
      List<ContingentStudent>? lgotnikiResponse,
      ContingentStudentGender? genderCount,
      String? error}) {
    return LgotnikiState(
        status: status ?? this.status,
        genderStatus: genderStatus ?? this.genderStatus,
        page: page ?? this.page,
        isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
        lgotnikiList: lgotnikiList ?? this.lgotnikiList,
        lgotnikiResponse: lgotnikiResponse ?? this.lgotnikiResponse,
        genderCount: genderCount ?? this.genderCount,
        error: error ?? this.error);
  }
}
