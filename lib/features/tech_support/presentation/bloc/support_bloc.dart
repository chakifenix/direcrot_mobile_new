import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/get_ticket_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'support_events.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final GetTicketList _getTicketList;
  SupportBloc({required GetTicketList getTicketList})
      : _getTicketList = getTicketList,
        super(const SupportState()) {
    on<TicketListFetch>(_ticketListFetch);
  }

  void _ticketListFetch(
      TicketListFetch event, Emitter<SupportState> emit) async {
    final res = await _getTicketList(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: SupportStatus.failure, error: failure.message)),
        (ticketList) => emit(state.copyWith(
            status: SupportStatus.success, ticketList: ticketList)));
  }
}
