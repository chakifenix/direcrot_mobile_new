import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/exceptions.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/tech_support/data/models/ticket_list_model.dart';

abstract interface class SupportDataSource {
  Future<List<TicketListModel>> getTicketList();
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
}
