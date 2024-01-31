import 'package:flutter/material.dart';
import 'package:insightful_news_251/style/app_text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Settings',
          style: AppTextStylesInsightfulNews.s28W600(),
        ),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
