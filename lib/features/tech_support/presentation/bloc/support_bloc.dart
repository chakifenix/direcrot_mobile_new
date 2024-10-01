import 'dart:io';

import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/chat_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/create_ticket_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/close_ticket.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/create_ticket.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/evaluate_ticket.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/get_chat_list.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/get_ticket_list.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'support_events.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final GetTicketList _getTicketList;
  final CreateTicket _createTicket;
  final GetChatList _getChatList;
  final SendMessage _sendMessage;
  final EvaluateTicketPut _evaluateTicketPut;
  final CloseTicketPut _closeTicketPut;
  SupportBloc(
      {required GetTicketList getTicketList,
      required CreateTicket createTicket,
      required GetChatList getChatList,
      required SendMessage sendMessage,
      required EvaluateTicketPut evaluateTicketPut,
      required CloseTicketPut closeTicketPut})
      : _getTicketList = getTicketList,
        _createTicket = createTicket,
        _getChatList = getChatList,
        _sendMessage = sendMessage,
        _evaluateTicketPut = evaluateTicketPut,
        _closeTicketPut = closeTicketPut,
        super(const SupportState()) {
    on<TicketListFetch>(_ticketListFetch);
    on<CreateTicketFetch>(_createTicketFetch);
    on<ImportFile>(_importFile);
    on<GetChatListFetch>(_getChatListFetch);
    on<SendMessageFetch>(_sendMessageFetch);
    on<FilePageFetch>(_importFilePage);
    on<EvaluateTicketFetch>(_evaluateTicketFetch);
    on<CloseTicketFetch>(_closeTicketFetch);
    on<SupportEvent>(
      (event, emit) =>
          emit(state.copyWith(evaluateStatus: SupportEvaluateStatus.initial)),
    );
  }

  void _ticketListFetch(
      TicketListFetch event, Emitter<SupportState> emit) async {
    emit(state.copyWith(status: SupportStatus.initial));
    final res = await _getTicketList(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: SupportStatus.failure, error: failure.message)),
        (ticketList) => emit(state.copyWith(
            status: SupportStatus.success,
            ticketList: ticketList,
            error: null)));
  }

  void _createTicketFetch(
      CreateTicketFetch event, Emitter<SupportState> emit) async {
    emit(state.copyWith(status: SupportStatus.initial));
    final res = await _createTicket(
        CreateTicketParams(
            initMessage: event.initMessage,
            title: event.title,
            files: event.files),
        null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: SupportStatus.failure, error: failure.message)),
        (success) => emit(state.copyWith(
            status: SupportStatus.success, createTicket: success)));
  }

  void _importFile(ImportFile event, Emitter<SupportState> emit) async {
    var maxFileSize = 10 * 1048576;
    try {
      // final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      final image = await ImagePicker().pickMedia();
      if (image == null) return;
      var imagePath = await image.readAsBytes();
      var fileSize = imagePath.length;
      if (fileSize <= maxFileSize) {
        final imageTemporary = File(image.path);
        List<String> imageName = [];
        List<XFile> imageFile = [];
        imageName.addAll(state.imageName);
        imageName.add(imageTemporary.path.split('/').last);
        imageFile.addAll(state.imageFile);
        imageFile.add(image);
        print(imageName[0]);
        emit(state.copyWith(
            imageName: imageName,
            imageFile: imageFile,
            importStatus: ImportFileStatus.success));
      } else {
        emit(state.copyWith(
            importStatus: ImportFileStatus.failure,
            error: 'размер файла превышает 10Мб'));
      }
    } catch (e) {
      debugPrint('Failed');
    }
  }

  void _importFilePage(FilePageFetch event, Emitter<SupportState> emit) {
    emit(state.copyWith(imageName: [], imageFile: []));
  }

  void _getChatListFetch(
      GetChatListFetch event, Emitter<SupportState> emit) async {
    emit(state.copyWith(detailStatus: SupportDetailStatus.initial));
    final res = await _getChatList(NoParams(), event.ticketId);
    res.fold(
        (failure) =>
            emit(state.copyWith(detailStatus: SupportDetailStatus.failure)),
        (chatList) => emit(state.copyWith(
            detailStatus: SupportDetailStatus.success, chatList: chatList)));
  }

  void _sendMessageFetch(
      SendMessageFetch event, Emitter<SupportState> emit) async {
    final res = await _sendMessage(
        SendMessageParams(event.message, event.orderNum), event.path);
    res.fold(
        (failure) => emit(state.copyWith(
            status: SupportStatus.failure, error: failure.message)),
        (sended) => emit(state.copyWith(status: SupportStatus.success)));
  }

  void _evaluateTicketFetch(
      EvaluateTicketFetch event, Emitter<SupportState> emit) async {
    final res =
        await _evaluateTicketPut(EvaluateTicketParams(event.grade), event.path);
    res.fold(
        (failure) => emit(state.copyWith(
            evaluateStatus: SupportEvaluateStatus.failure,
            error: failure.message)),
        (evaluateSuccess) => emit(state.copyWith(
            evaluateStatus: SupportEvaluateStatus.success,
            evaluateSuccess: evaluateSuccess)));
  }

  void _closeTicketFetch(
      CloseTicketFetch event, Emitter<SupportState> emit) async {
    final res = await _closeTicketPut(NoParams(), event.path);
    res.fold(
        (failure) => emit(state.copyWith(
            evaluateStatus: SupportEvaluateStatus.failure,
            error: failure.message)),
        (close) => emit(state.copyWith(
            evaluateStatus: SupportEvaluateStatus.success,
            closeSuccess: close)));
  }
}
