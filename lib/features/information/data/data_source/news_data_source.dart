import 'package:dio/dio.dart';
import 'package:direcrot_mobile_new/core/internet_services/dio_client.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/paths.dart';
import 'package:direcrot_mobile_new/features/information/data/models/article_model.dart';

abstract interface class NewsDataSource {
  Future<List<ArticleModel>> getArticle();
}

class NewsDataSourceImpl implements NewsDataSource {
  @override
  Future<List<ArticleModel>> getArticle() async {
    try {
      final response = await DioClient.instance.get(news);
      List<dynamic> data = response['data'];
      return data.map((newsList) => ArticleModel.fromjson(newsList)).toList();
    } on DioException catch (e) {
      var error = DioExceptionService.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
