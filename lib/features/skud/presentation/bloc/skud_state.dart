part of 'skud_bloc.dart';

enum SkudStatus { initial, loading, success, failure }

class SkudState extends Equatable {
  final SkudStatus status;
  final int page;
  final bool isPaginationLoading;
  final List<SkudEntity>? skudList;
  final List<SkudEntity> skudResponse;
  final String? error;

  const SkudState(
      {this.status = SkudStatus.initial,
      this.page = 1,
      this.isPaginationLoading = false,
      this.skudList,
      this.skudResponse = const [],
      this.error});

  @override
  List<Object?> get props =>
      [status, page, isPaginationLoading, skudList, skudResponse, error];

  bool get isInitial => status == SkudStatus.initial;
  bool get isLoading => status == SkudStatus.loading;
  bool get isSuccess => status == SkudStatus.success;
  bool get isFailure => status == SkudStatus.failure;

  SkudState copyWith(
      {SkudStatus? status,
      int? page,
      bool? isPaginationLoading,
      List<SkudEntity>? skudList,
      List<SkudEntity>? skudResponse,
      String? error}) {
    return SkudState(
        status: status ?? this.status,
        page: page ?? this.page,
        isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
        skudList: skudList ?? this.skudList,
        skudResponse: skudResponse ?? this.skudResponse,
        error: error ?? this.error);
  }
}
