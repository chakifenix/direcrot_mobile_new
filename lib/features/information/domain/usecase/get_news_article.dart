import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/information/domain/entities/article.dart';
import 'package:direcrot_mobile_new/features/information/domain/repository/news_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetNewsArticle implements UseCase<List<Article>, NoParams> {
  final NewsRepository newsRepository;
  GetNewsArticle(this.newsRepository);
  @override
  Future<Either<Failure, List<Article>>> call(
      NoParams params, String? path) async {
    return await newsRepository.getNewsData();
  }
}
