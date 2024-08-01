import 'package:direcrot_mobile_new/core/common/entities/contingent_student.dart';
import 'package:direcrot_mobile_new/features/lgotniki/domain/usecase/get_lgotniki_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'lgotniki_events.dart';
part 'lgotniki_state.dart';

class LgotnikiBloc extends Bloc<LgotnikiEvent, LgotnikiState> {
  final GetLgotnikiData _getLgotnikiData;
  LgotnikiBloc({required GetLgotnikiData getLgotnikiData})
      : _getLgotnikiData = getLgotnikiData,
        super(const LgotnikiState()) {
    on<LgotnikiDataFetch>(_onFtechLgotniki);
  }

  void _onFtechLgotniki(
      LgotnikiDataFetch event, Emitter<LgotnikiState> emit) async {
    if (state.isPaginationLoading) return;
    emit(state.copyWith(isPaginationLoading: true));
    final page = event.page ?? state.page;
    print("----Pagination page: ${page} ");
    final res = await _getLgotnikiData(LgotnikiParams(page: page), null);
    res.fold(
        (failure) => emit(state.copyWith(
              isPaginationLoading: false,
              status: LgotnikiStatus.failure,
              error: failure.message,
            )), (lgotniki) {
      final List<ContingentStudent> answer = page == 1
          ? lgotniki
          : (List.of(state.lgotnikiResponse)..addAll(lgotniki));
      emit(state.copyWith(
        page: page + 1,
        isPaginationLoading: false,
        status: LgotnikiStatus.success,
        lgotnikiList: lgotniki,
        lgotnikiResponse: answer,
      ));
    });
  }
}
