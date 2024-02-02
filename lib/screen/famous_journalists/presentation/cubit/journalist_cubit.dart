import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insightful_news_251/screen/famous_journalists/data/models/journalists_model.dart';
import 'package:insightful_news_251/utils/kks.dart';

part 'journalist_cubit.freezed.dart';
part 'journalist_state.dart';

class JournalistCubit extends Cubit<JournalistState> {
  JournalistCubit() : super(const JournalistState.initial());
  final dio = Dio();

  List<JournalistsMode> localModels = [];
  Future getData() async {
    emit(const JournalistState.loading());
    try {
      final result = await dio.get(fbUrl('journalists'));
      final listModel = result.data
          .map<JournalistsMode>(
            (e) => JournalistsMode.fromJson(e),
          )
          .toList();
      localModels.addAll(listModel);
      log('data: localModels: $localModels ');
      emit(JournalistState.success(models: listModel));
    } catch (e) {
      emit(JournalistState.error(e));
    }
  }
}
