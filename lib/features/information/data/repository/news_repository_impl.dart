import 'package:direcrot_mobile_new/core/internet_services/error/dio_exception.dart';
import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/information/data/data_source/news_data_source.dart';
import 'package:direcrot_mobile_new/features/information/domain/entities/article.dart';
import 'package:direcrot_mobile_new/features/information/domain/repository/news_repository.dart';
import 'package:fpdart/fpdart.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required this.newsDataSource});
  final NewsDataSource newsDataSource;

  @override
  Future<Either<Failure, List<Article>>> getNewsData() async {
    return _getNewsData(() async => await newsDataSource.getArticle());
  }

  Future<Either<Failure, List<Article>>> _getNewsData(
    Future<List<Article>> Function() fn,
  ) async {
    try {
      final stats = await fn();
      return right(stats);
    } on DioExceptionService catch (e) {
      return left(Failure(e.errorMessage));
    }
  }
}
