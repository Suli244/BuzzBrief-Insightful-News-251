import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/dsfadfad/asdfas.dart';
import 'package:insightful_news_251/screen/bottom_navigation_bar/sdfadfaf.dart';
import 'package:insightful_news_251/screen/onboarding/widget/button_widget.dart';
import 'package:insightful_news_251/screen/onboarding/widget/restore_widgets.dart';
import 'package:insightful_news_251/screen/onboarding/widget/web_view_insightful_news.dart';
import 'package:insightful_news_251/utils/images/gdsgsg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Premium extends StatelessWidget {
  const Premium({super.key, this.isPrem = false});
  final bool isPrem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (isPrem) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GFEdgsrgsd(),
                        ),
                        (protected) => false,
                      );
                    }
                  },
                  child: Image.asset(
                    Gdsgsg.closeIcon,
                    height: 34,
                    width: 34,
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(height: 20.w),
            Center(
              child: FittedBox(
                child: Image.asset(
                  Gdsgsg.premium,
                  width: 280.w,
                  height: 285.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                        child: Text(
                          'PREMIUM',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                            fontFamily: 'SF',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Image.asset(
                        Gdsgsg.crownIcon,
                        height: 26,
                        width: 26,
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      Image.asset(
                        Gdsgsg.crownIcon,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 7.w),
                      const Text(
                        'Without Ads',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: 'SF',
                          color: AppColorsInsightfulNews.color000000,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Image.asset(
                        Gdsgsg.crownIcon,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 7.w),
                      const FittedBox(
                        child: Text(
                          'Unlock News Notifications',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: 'SF',
                            color: AppColorsInsightfulNews.color000000,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 48.h),
                  ButtonWidget(
                    color: AppColorsInsightfulNews.color00B2FF,
                    onPress: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('buy', true);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GFEdgsrgsd(),
                        ),
                        (protected) => false,
                      );
                    },
                    height: 61.h,
                    radius: 12,
                    text: 'Buy Premium for \$0,99',
                  ),
                  SizedBox(height: 30.h),
                  RestoreButtons(
                    onPressTermOfService: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebFFInsightfulNews(
                            title: 'Term of use',
                            url: 'DocFFInsightfulNews.tUse',
                          ),
                        ),
                      );
                    },
                    onPressSupport: () {},
                    onPressPrivacyPolicy: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebFFInsightfulNews(
                            title: 'Privacy Policy',
                            url: 'DocFFInsightfulNews.pP',
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 18.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
