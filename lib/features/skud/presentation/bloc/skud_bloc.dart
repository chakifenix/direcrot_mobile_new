import 'package:direcrot_mobile_new/features/skud/domain/entities/skud_entity.dart';
import 'package:direcrot_mobile_new/features/skud/domain/usecases/get_skud_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'skud_events.dart';
part 'skud_state.dart';

class SkudBloc extends Bloc<SkudEvent, SkudState> {
  final GetSkudList _getSkudList;
  SkudBloc({required GetSkudList getSkudList})
      : _getSkudList = getSkudList,
        super(const SkudState()) {
    on<SkudListDataFetch>(_skudListDataFetch);
  }

  void _skudListDataFetch(
      SkudListDataFetch event, Emitter<SkudState> emit) async {
    if (state.isPaginationLoading) return;
    emit(state.copyWith(isPaginationLoading: true));
    final page = event.page ?? state.page;
    print("----Pagination page: ${page} ");
    final res = await _getSkudList(
        SkudListParams(
            page: page,
            passType: event.passType,
            dateFrom: event.dateFrom,
            dateTo: event.dateTo),
        null);
    res.fold(
        (failure) => emit(state.copyWith(
            isPaginationLoading: false,
            status: SkudStatus.failure,
            error: failure.message)), (skudList) {
      final List<SkudEntity> answer = page == 1
          ? skudList
          : (List.of(state.skudResponse)..addAll(skudList));
      emit(state.copyWith(
          page: page + 1,
          isPaginationLoading: false,
          status: SkudStatus.success,
          skudList: skudList,
          skudResponse: answer));
    });
  }
}
