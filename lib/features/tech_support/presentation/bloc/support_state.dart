part of 'support_bloc.dart';

enum SupportStatus { initial, loading, success, failure }

class SupportState extends Equatable {
  final SupportStatus status;
  final List<TicketListEntity> ticketList;
  final String? success;
  final List<String> imageName;
  final List<XFile> imageFile;
  final List<String> chatList;
  final String? error;

  const SupportState(
      {this.status = SupportStatus.initial,
      this.ticketList = const [],
      this.success,
      this.imageName = const [],
      this.imageFile = const [],
      this.chatList = const [],
      this.error});

  @override
  List<Object?> get props =>
      [status, ticketList, success, imageName, imageFile, chatList, error];

  bool get isInitial => status == SupportStatus.initial;
  bool get isLoading => status == SupportStatus.loading;
  bool get isSuccess => status == SupportStatus.success;
  bool get isFailure => status == SupportStatus.failure;

  SupportState copyWith(
      {SupportStatus? status,
      List<TicketListEntity>? ticketList,
      String? success,
      List<String>? imageName,
      List<XFile>? imageFile,
      List<String>? chatList,
      String? error}) {
    return SupportState(
        status: status ?? this.status,
        ticketList: ticketList ?? this.ticketList,
        success: success ?? this.success,
        imageName: imageName ?? this.imageName,
        imageFile: imageFile ?? this.imageFile,
        chatList: chatList ?? this.chatList,
        error: error ?? this.error);
  }
}
