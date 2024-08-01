import 'package:direcrot_mobile_new/core/internet_services/error/failure.dart';
import 'package:direcrot_mobile_new/features/information/domain/entities/article.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class NewsRepository {
  Future<Either<Failure, List<Article>>> getNewsData();
}
