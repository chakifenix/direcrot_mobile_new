part of 'lgotniki_bloc.dart';

enum LgotnikiStatus { initial, loading, success, failure }

class LgotnikiState extends Equatable {
  final LgotnikiStatus status;
  final int page;
  final bool isPaginationLoading;
  final List<ContingentStudent>? lgotnikiList;
  final List<ContingentStudent> lgotnikiResponse;
  final String? error;

  const LgotnikiState(
      {this.status = LgotnikiStatus.initial,
      this.page = 1,
      this.isPaginationLoading = false,
      this.lgotnikiList,
      this.lgotnikiResponse = const [],
      this.error});

  @override
  List<Object?> get props => [
        status,
        page,
        isPaginationLoading,
        lgotnikiList,
        lgotnikiResponse,
        error
      ];

  bool get isInitial => status == LgotnikiStatus.initial;
  bool get isLoading => status == LgotnikiStatus.loading;
  bool get isSuccess => status == LgotnikiStatus.success;
  bool get isFailure => status == LgotnikiStatus.failure;

  LgotnikiState copyWith(
      {LgotnikiStatus? status,
      int? page,
      bool? isPaginationLoading,
      List<ContingentStudent>? lgotnikiList,
      List<ContingentStudent>? lgotnikiResponse,
      String? error}) {
    return LgotnikiState(
        status: status ?? this.status,
        page: page ?? this.page,
        isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
        lgotnikiList: lgotnikiList ?? this.lgotnikiList,
        lgotnikiResponse: lgotnikiResponse ?? this.lgotnikiResponse,
        error: error ?? this.error);
  }
}
