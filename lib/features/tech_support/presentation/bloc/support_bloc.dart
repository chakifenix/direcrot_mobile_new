import 'dart:io';

import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/entity/ticket_list_entity.dart';
import 'package:direcrot_mobile_new/features/tech_support/domain/usecase/create_ticket.dart';
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
  SupportBloc(
      {required GetTicketList getTicketList,
      required CreateTicket createTicket,
      required GetChatList getChatList,
      required SendMessage sendMessage})
      : _getTicketList = getTicketList,
        _createTicket = createTicket,
        _getChatList = getChatList,
        _sendMessage = sendMessage,
        super(const SupportState()) {
    on<TicketListFetch>(_ticketListFetch);
    on<CreateTicketFetch>(_createTicketFetch);
    on<ImportFile>(_importFile);
    on<GetChatListFetch>(_getChatListFetch);
    on<SendMessageFetch>(_sendMessageFetch);
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
        (success) => emit(
            state.copyWith(status: SupportStatus.success, success: success)));
  }

  void _importFile(ImportFile event, Emitter<SupportState> emit) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      List<String> imageName = [];
      List<XFile> imageFile = [];
      imageName.addAll(state.imageName);
      imageName.add(imageTemporary.path.split('/').last);
      imageFile.addAll(state.imageFile);
      imageFile.add(image);
      print(imageName[0]);
      emit(state.copyWith(imageName: imageName, imageFile: imageFile));
    } catch (e) {
      debugPrint('Failed');
    }
  }

  void _getChatListFetch(
      GetChatListFetch event, Emitter<SupportState> emit) async {
    emit(state.copyWith(status: SupportStatus.initial));
    final res = await _getChatList(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(status: SupportStatus.failure)),
        (chatList) => emit(
            state.copyWith(status: SupportStatus.success, chatList: chatList)));
  }

  void _sendMessageFetch(
      SendMessageFetch event, Emitter<SupportState> emit) async {
    final res = await _sendMessage(
        SendMessageParams(event.message, event.orderNum), null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: SupportStatus.failure, error: failure.message)),
        (sended) => emit(state.copyWith(status: SupportStatus.success)));
  }
}
