import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insightful_news_251/screen/news/models/news_models.dart';
import 'package:insightful_news_251/utils/kks.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsState.loading());

  final dio = Dio();

  getNewsData(String category) async {
    emit(const NewsState.loading());
    try {
      final newsResult = await dio.get(fbUrl('news'));
      List<NewsModel> newsList =
          newsResult.data.map<NewsModel>((e) => NewsModel.fromMap(e)).toList();
      if (category != 'All News') {
        newsList.removeWhere((e) => e.category != category);
      }
      emit(
        NewsState.success(newsList),
      );
    } catch (e) {
      emit(NewsState.error(e.toString()));
    }
  }
}
