part of 'pitania_bloc.dart';

enum PitaniaStatus { initial, loading, success, failure }

enum PitaniaCountStatus { initial, loading, success, failure }

class PitaniaState extends Equatable {
  final PitaniaStatus status;
  final PitaniaCountStatus countStatus;
  final int page;
  final bool isPaginationLoading;
  final List<PitaniaEntity>? pitaniaList;
  final List<PitaniaEntity> pitaniaResponse;
  final PitaniaMetaEntity? pitaniaMetaEntityBenefic;
  final PitaniaMetaEntity? pitaniaLowClass;

  final String? error;

  const PitaniaState(
      {this.status = PitaniaStatus.initial,
      this.countStatus = PitaniaCountStatus.initial,
      this.page = 1,
      this.isPaginationLoading = false,
      this.pitaniaList,
      this.pitaniaResponse = const [],
      this.pitaniaMetaEntityBenefic,
      this.pitaniaLowClass,
      this.error});

  @override
  List<Object?> get props => [
        status,
        page,
        isPaginationLoading,
        pitaniaList,
        pitaniaResponse,
        pitaniaMetaEntityBenefic,
        pitaniaLowClass,
        error
      ];

  bool get isInitial => status == PitaniaStatus.initial;
  bool get isLoading => status == PitaniaStatus.loading;
  bool get isSuccess => status == PitaniaStatus.success;
  bool get isFailure => status == PitaniaStatus.failure;

  bool get isCountInitial => countStatus == PitaniaCountStatus.initial;
  bool get isCountLoading => countStatus == PitaniaCountStatus.loading;
  bool get isCountSuccess => countStatus == PitaniaCountStatus.success;
  bool get isCountFailure => countStatus == PitaniaCountStatus.failure;

  PitaniaState copyWith(
      {PitaniaStatus? status,
      PitaniaCountStatus? countStatus,
      int? page,
      bool? isPaginationLoading,
      List<PitaniaEntity>? pitaniaList,
      List<PitaniaEntity>? pitaniaResponse,
      PitaniaMetaEntity? pitaniaMetaEntityBenefic,
      PitaniaMetaEntity? pitaniaLowClass,
      String? error}) {
    return PitaniaState(
        status: status ?? this.status,
        countStatus: countStatus ?? this.countStatus,
        page: page ?? this.page,
        isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
        pitaniaList: pitaniaList ?? this.pitaniaList,
        pitaniaResponse: pitaniaResponse ?? this.pitaniaResponse,
        pitaniaMetaEntityBenefic:
            pitaniaMetaEntityBenefic ?? this.pitaniaMetaEntityBenefic,
        pitaniaLowClass: pitaniaLowClass ?? this.pitaniaLowClass,
        error: error ?? this.error);
  }
}
