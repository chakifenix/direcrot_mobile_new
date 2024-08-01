import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_entity.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/entities/pitania_meta_entity.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/usecase/get_all_pitania_list.dart';
import 'package:direcrot_mobile_new/features/pitania/domain/usecase/get_pitania_count.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pitania_events.dart';
part 'pitania_state.dart';

class PitaniaBloc extends Bloc<PitaniaEvent, PitaniaState> {
  final GetAllPitaniaList _getAllPitaniaList;
  final GetPitaniaCount _getPitaniaCount;
  PitaniaBloc(
      {required GetAllPitaniaList getAllPitaniaList,
      required GetPitaniaCount getPitaniaCount})
      : _getAllPitaniaList = getAllPitaniaList,
        _getPitaniaCount = getPitaniaCount,
        super(const PitaniaState()) {
    on<PitaniaListFetch>(_pitaniaListFetch);
    on<PitaniaCountFetch>(_pitaniaCountFetch);
  }

  void _pitaniaCountFetch(
      PitaniaCountFetch event, Emitter<PitaniaState> emit) async {
    final res = await _getPitaniaCount(PitaniaCountParams(1, null, null), null);
    final resp = await _getPitaniaCount(PitaniaCountParams(null, 1, 4), null);
    res.fold(
        (failure) => emit(state.copyWith(
            countStatus: PitaniaCountStatus.failure, error: failure.message)),
        (pitaniaMeta) => emit(state.copyWith(
            countStatus: PitaniaCountStatus.success,
            pitaniaMetaEntityBenefic: pitaniaMeta)));
    resp.fold(
        (failure) => emit(state.copyWith(
            countStatus: PitaniaCountStatus.failure, error: failure.message)),
        (pitaniaLowClass) => emit(state.copyWith(
            countStatus: PitaniaCountStatus.success,
            pitaniaLowClass: pitaniaLowClass)));
  }

  void _pitaniaListFetch(
      PitaniaListFetch event, Emitter<PitaniaState> emit) async {
    if (state.isPaginationLoading) return;
    emit(state.copyWith(isPaginationLoading: true));
    final page = event.page ?? state.page;
    print("----Pagination page: ${page} ");
    final res = await _getAllPitaniaList(PitaniaListParams(page: page), null);
    res.fold(
        (failure) => emit(state.copyWith(
            isPaginationLoading: false,
            status: PitaniaStatus.failure,
            error: failure.message)), (pitaniaList) {
      final List<PitaniaEntity> answer = page == 1
          ? pitaniaList
          : (List.of(state.pitaniaResponse)..addAll(pitaniaList));
      // page == 1 ? pitaniaList : List.of(state.pitaniaResponse)
      //   ..addAll(pitaniaList);
      emit(state.copyWith(
          page: page + 1,
          isPaginationLoading: false,
          status: PitaniaStatus.success,
          pitaniaList: pitaniaList,
          pitaniaResponse: answer));
    });
  }
}
