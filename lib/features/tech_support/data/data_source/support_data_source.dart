import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/exceptions.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/models/chat_list_model.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/models/chat_send_model.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/models/create_ticket_model.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/models/ticket_list_model.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class SupportDataSource {
  Future<List<TicketListModel>> getTicketList();
  Future<CreateTicketModel> createTicket(
      String initMessage, String title, List<XFile> files);
  Future<List<ChatListModel>> getChat(String path);
  Future<ChatSendModel> sendChat(String message, String orderNum, String path);
  Future<String> ticketEvaluate(String grade, String path);
  Future<String> closeTicket(String path);
}

class SupportDataSourceImpl implements SupportDataSource {
  @override
  Future<List<TicketListModel>> getTicketList() async {
    try {
      final response = await DioClient.instance.get(supportTicket);
      List<dynamic> data = response['data'];
      return data
          .map((ticketList) => TicketListModel.fromJson(ticketList))
          .toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }

  @override
  Future<CreateTicketModel> createTicket(
      String initMessage, String title, List<XFile>? files) async {
    FormData formData =
        FormData.fromMap({'initial_message': initMessage, 'title': title});
    if (files != null) {
      for (XFile item in files) {
        formData.files.addAll(
            [MapEntry('files[]', await MultipartFile.fromFile(item.path))]);
      }
    }

    try {
      final response =
          await DioClient.instance.postMessage(supportTicket, data: formData);
      return CreateTicketModel.fromJson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }

  @override
  Future<List<ChatListModel>> getChat(String path) async {
    try {
      final response = await DioClient.instance.get('$supportChat/$path');
      List<dynamic> data = response['data'];

      return data.map((chatList) => ChatListModel.fromJson(chatList)).toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }

  @override
  Future<ChatSendModel> sendChat(
      String message, String orderNum, String path) async {
    try {
      final response = await DioClient.instance.postMessage(
          '$supportChat/$path',
          data: {'message_body': message, 'order_num': orderNum});
      return ChatSendModel.fromJson(response['data']);
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }

  @override
  Future<String> ticketEvaluate(String grade, String path) async {
    try {
      final response = await DioClient.instance
          .postMessage('$supportTicket/$path', data: {'grade': grade});
      return response['data'];
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }

  @override
  Future<String> closeTicket(String path) async {
    try {
      final response = await DioClient.instance.put('$supportTicket/$path');
      return response['data'];
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }
}
