import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/exceptions.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/models/ticket_list_model.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class SupportDataSource {
  Future<List<TicketListModel>> getTicketList();
  Future<String> createTicket(
      String initMessage, String title, List<XFile> files);
  Future<List<String>> getChat();
  Future<String> sendChat(String message, String orderNum);
}

class SupportDataSourceImpl implements SupportDataSource {
  @override
  Future<List<TicketListModel>> getTicketList() async {
    try {
      final response = await DioClient.instance.get(support);
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
  Future<String> createTicket(
      String initMessage, String title, List<XFile> files) async {
    FormData formData =
        FormData.fromMap({'initial_message': initMessage, 'title': title});
    for (XFile item in files) {
      formData.files
          .addAll([MapEntry('file', await MultipartFile.fromFile(item.path))]);
    }
    try {
      final response = await DioClient.instance.post(support, data: formData);
      return response['data'];
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }

  @override
  Future<List<String>> getChat() async {
    try {
      final response = await DioClient.instance.get(support);
      return response['data'];
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }

  @override
  Future<String> sendChat(String message, String orderNum) async {
    try {
      final response = await DioClient.instance.get(support);
      return response['data'];
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw ServerException(error.errorMessage);
    }
  }
}
