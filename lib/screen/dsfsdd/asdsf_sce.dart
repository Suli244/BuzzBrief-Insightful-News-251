import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:insightful_news_251/screen/bottom_navigation_bar/sdfadfaf.dart';
import 'package:insightful_news_251/screen/onboarding/asffsafs.dart';
import 'package:insightful_news_251/utils/dsaad/adfafa.dart';
import 'package:insightful_news_251/utils/premium/fadf.dart';

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
              Gdsgsg.splashLogo,
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
    final isFirst = await FirstOpenInsightfulNews.fop();
    if (!isFirst) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Fssdsdg(),
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
          builder: (context) => const GFEdgsrgsd(),
        ),
      );
    }
  }
}
