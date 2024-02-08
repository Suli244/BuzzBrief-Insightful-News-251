import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:insightful_news_251/l_p/dffgdfg/dsafasdfaf/prem_hive_model.dart';
import 'package:insightful_news_251/l_p/dffgdfg/sasfdsf.dart';
import 'package:insightful_news_251/l_p/dffgdfg/safffs.dart';
import 'package:insightful_news_251/l_p/uajds.dart';
import 'package:insightful_news_251/main.dart';
import 'package:insightful_news_251/utils/kks.dart';

premidsfjb() async {
  final Gjhkdafjlaf? model = await HJKHEfdf().fff();
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
      final asdfad = KJDFLadf.fromJson(result.data);
      await HJKHEfdf().sssss(
        Gjhkdafjlaf(
          secondUrl: '${asdfad.fasfa3}${asdfad.dfafsd4}',
          isOpen: asdfad.isPr,
        ),
      );

      if (asdfad.isPr) {
        runApp(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: EDjahPage(
              link: '${asdfad.arar1}${asdfad.fdadf2}',
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
