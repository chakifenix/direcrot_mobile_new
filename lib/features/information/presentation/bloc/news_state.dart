part of 'news_bloc.dart';

enum NewsStatus { initial, loading, success, failure }

class NewsState extends Equatable {
  final NewsStatus status;
  final List<Article> newsArticles;
  final String? exception;

  const NewsState(
      {this.status = NewsStatus.initial,
      this.newsArticles = const [],
      this.exception});

  @override
  List<Object?> get props => [status, newsArticles, exception];

  bool get isInitial => status == NewsStatus.initial;
  bool get isLoading => status == NewsStatus.loading;
  bool get isSuccess => status == NewsStatus.success;
  bool get isFailure => status == NewsStatus.failure;

  NewsState copyWith(
      {NewsStatus? status, List<Article>? newsArticles, String? exception}) {
    return NewsState(
        status: status ?? this.status,
        newsArticles: newsArticles ?? this.newsArticles,
        exception: exception ?? this.exception);
  }
}
