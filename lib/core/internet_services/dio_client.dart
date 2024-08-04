import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/services/local_storage.dart';

class DioClient {
  DioClient._();

  static final instance = DioClient._();

  final Dio _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json));

  ///Get Method
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    var scopedToken = await LocalStorage().readValue('token');
    var connectionId = await LocalStorage().readValue('connectionId');
    var roleId = await LocalStorage().readValue('roleId');
    Map<String, dynamic> headersData = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $scopedToken',
      'X-Role-Id': roleId,
      'X-Connection-Id': connectionId
    };
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headersData),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  ///Post Method
  Future<Map<String, dynamic>> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      if (response.statusCode == 401) {
        response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  ///Put Method
  Future<Map<String, dynamic>> put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    var scopedToken = await LocalStorage().readValue('token');
    var connectionId = await LocalStorage().readValue('connectionId');
    var roleId = await LocalStorage().readValue('roleId');
    Map<String, dynamic> headersData = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $scopedToken',
      'X-Role-Id': roleId,
      'X-Connection-Id': connectionId
    };
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headersData),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }
}
