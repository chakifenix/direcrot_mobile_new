import 'package:direcrot_mobile_new/core/usecase/usecase.dart';
import 'package:direcrot_mobile_new/features/information/domain/entities/article.dart';
import 'package:direcrot_mobile_new/features/information/domain/usecase/get_news_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_events.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsArticle _getNewsArticle;
  NewsBloc({required GetNewsArticle getNewsArticle})
      : _getNewsArticle = getNewsArticle,
        super(const NewsState()) {
    on<NewsEvent>(
      (event, emit) => emit(state.copyWith(status: NewsStatus.loading)),
    );
    on<GetArticles>(_getArticle);
  }

  void _getArticle(GetArticles event, Emitter<NewsState> emit) async {
    final res = await _getNewsArticle(NoParams(), null);
    res.fold(
        (failure) => emit(state.copyWith(
            status: NewsStatus.failure, exception: failure.message)),
        (article) => emit(
            state.copyWith(status: NewsStatus.success, newsArticles: article)));
  }
}
