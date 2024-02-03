import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/screen/afasfasf/widget/settings_item_widget.dart';
import 'package:insightful_news_251/screen/onboarding/widget/web_view_insightful_news.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 7.w),
          child: const Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SettingItemWidget(
              title: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFFInsightfulNews(
                      title: 'Privacy Policy',
                      url:
                          'https://docs.google.com/document/d/1aOj5DbGhxOOucsbQ0YtKfFjoRt-8j60Bb4fhxDRa12U/edit?usp=sharing',
                    ),
                  ),
                );
              },
              top: 10.h,
              bottom: 20.h,
            ),
            Divider(
              color: Colors.black.withOpacity(0.30),
              thickness: 0.7,
              height: 0,
            ),
            SettingItemWidget(
              title: 'Term of use',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFFInsightfulNews(
                      title: 'Term of use',
                      url:
                          'https://docs.google.com/document/d/1oRCRubxKVVfzxyL4hN262IUkLb07MY0hdhnwN7PMYQ4/edit?usp=sharing',
                    ),
                  ),
                );
              },
              top: 20.h,
              bottom: 20.h,
            ),
            Divider(
              color: Colors.black.withOpacity(0.30),
              thickness: 0.7,
              height: 0,
            ),
            SettingItemWidget(
              title: 'Support',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFFInsightfulNews(
                      title: 'Support',
                      url: 'https://forms.gle/TXsbNEFLdb5e4Y9u8',
                    ),
                  ),
                );
              },
              top: 20.h,
              bottom: 20.h,
            ),
            Divider(
              color: Colors.black.withOpacity(0.30),
              thickness: 0.7,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
