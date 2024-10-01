part of 'support_bloc.dart';

enum SupportStatus { initial, loading, success, failure }

enum SupportDetailStatus { initial, loading, success, failure }

enum SupportEvaluateStatus { initial, loading, success, failure }

enum ImportFileStatus { initial, loading, success, failure }

class SupportState extends Equatable {
  final SupportStatus status;
  final SupportDetailStatus detailStatus;
  final SupportEvaluateStatus evaluateStatus;
  final ImportFileStatus importStatus;
  final List<TicketListEntity> ticketList;
  final CreateTicketEntity? createTicket;
  final List<String> imageName;
  final List<XFile> imageFile;
  final List<ChatListEntity> chatList;
  final String? evaluateSuccess;
  final String? closeSuccess;
  final String? error;

  const SupportState(
      {this.status = SupportStatus.initial,
      this.detailStatus = SupportDetailStatus.initial,
      this.evaluateStatus = SupportEvaluateStatus.initial,
      this.importStatus = ImportFileStatus.initial,
      this.ticketList = const [],
      this.createTicket,
      this.imageName = const [],
      this.imageFile = const [],
      this.chatList = const [],
      this.evaluateSuccess,
      this.closeSuccess,
      this.error});

  @override
  List<Object?> get props => [
        status,
        detailStatus,
        evaluateStatus,
        importStatus,
        ticketList,
        createTicket,
        imageName,
        imageFile,
        chatList,
        evaluateSuccess,
        closeSuccess,
        error
      ];

  bool get isInitial => status == SupportStatus.initial;
  bool get isLoading => status == SupportStatus.loading;
  bool get isSuccess => status == SupportStatus.success;
  bool get isFailure => status == SupportStatus.failure;

  bool get isDetailInitial => detailStatus == SupportDetailStatus.initial;
  bool get isDetailLoading => detailStatus == SupportDetailStatus.loading;
  bool get isDetailSuccess => detailStatus == SupportDetailStatus.success;
  bool get isDetailFailure => detailStatus == SupportDetailStatus.failure;

  bool get isEvaluateInitial => evaluateStatus == SupportEvaluateStatus.initial;
  bool get isEvaluateLoading => evaluateStatus == SupportEvaluateStatus.loading;
  bool get isEvaluateSuccess => evaluateStatus == SupportEvaluateStatus.success;
  bool get isEvaluateFailure => evaluateStatus == SupportEvaluateStatus.failure;

  bool get isImportInitial => importStatus == ImportFileStatus.initial;
  bool get isImportLoading => importStatus == ImportFileStatus.loading;
  bool get isImportSuccess => importStatus == ImportFileStatus.success;
  bool get isImportFailure => importStatus == ImportFileStatus.failure;

  SupportState copyWith(
      {SupportStatus? status,
      SupportDetailStatus? detailStatus,
      SupportEvaluateStatus? evaluateStatus,
      ImportFileStatus? importStatus,
      List<TicketListEntity>? ticketList,
      CreateTicketEntity? createTicket,
      List<String>? imageName,
      List<XFile>? imageFile,
      List<ChatListEntity>? chatList,
      String? evaluateSuccess,
      String? closeSuccess,
      String? error}) {
    return SupportState(
        status: status ?? this.status,
        detailStatus: detailStatus ?? this.detailStatus,
        evaluateStatus: evaluateStatus ?? this.evaluateStatus,
        importStatus: importStatus ?? this.importStatus,
        ticketList: ticketList ?? this.ticketList,
        createTicket: createTicket ?? this.createTicket,
        imageName: imageName ?? this.imageName,
        imageFile: imageFile ?? this.imageFile,
        chatList: chatList ?? this.chatList,
        evaluateSuccess: evaluateSuccess ?? this.evaluateSuccess,
        closeSuccess: closeSuccess ?? this.closeSuccess,
        error: error ?? this.error);
  }
}
