part of 'support_bloc.dart';

enum SupportStatus { initial, loading, success, failure }

class SupportState extends Equatable {
  final SupportStatus status;
  final List<TicketListEntity> ticketList;
  final String? error;

  const SupportState(
      {this.status = SupportStatus.initial,
      this.ticketList = const [],
      this.error});

  @override
  List<Object?> get props => [status, ticketList, error];

  bool get isInitial => status == SupportStatus.initial;
  bool get isLoading => status == SupportStatus.loading;
  bool get isSuccess => status == SupportStatus.success;
  bool get isFailure => status == SupportStatus.failure;

  SupportState copyWith(
      {SupportStatus? status,
      List<TicketListEntity>? ticketList,
      String? error}) {
    return SupportState(
        status: status ?? this.status,
        ticketList: ticketList ?? this.ticketList,
        error: error ?? this.error);
  }
}
