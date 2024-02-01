import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:insightful_news_251/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:insightful_news_251/screen/onboarding/onboarding_screen.dart';
import 'package:insightful_news_251/utils/images/app_images.dart';
import 'package:insightful_news_251/utils/premium/first_open.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    toGoOnBoarInsightfulNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.splashLogo,
              width: 100.w,
              height: 100.h,
            ),
          ),
        ],
      ),
    );
  }

  toGoOnBoarInsightfulNews() async {
    await Future.delayed(const Duration(milliseconds: 1450));
      final isFirst = await FirstOpenInsightfulNews.getFirstOpen();
      if (!isFirst) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
        await Future.delayed(const Duration(seconds: 8));
        try {
          final InAppReview inAppReview = InAppReview.instance;
          if (await inAppReview.isAvailable()) {
            inAppReview.requestReview();
          }
        } catch (e) {
          throw Exception(e);
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigatorScreen(),
          ),
        );
      }
  }
}
