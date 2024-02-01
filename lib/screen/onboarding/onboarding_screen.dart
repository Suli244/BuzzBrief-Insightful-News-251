import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:insightful_news_251/screen/onboarding/widget/button_widget.dart';
import 'package:insightful_news_251/screen/onboarding/widget/onboarding_item_widget.dart';
import 'package:insightful_news_251/screen/onboarding/widget/restore_widgets.dart';
import 'package:insightful_news_251/screen/onboarding/widget/web_view_insightful_news.dart';
import 'package:insightful_news_251/style/app_colors.dart';
import 'package:insightful_news_251/utils/images/app_images.dart';
import 'package:insightful_news_251/utils/premium/first_open.dart';
import 'package:insightful_news_251/utils/urls.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              physics: const ClampingScrollPhysics(),
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currantPage = value;
                });
              },
              children: const [
                OnboardingItemWidger(
                  foto: AppImages.onboardingOne,
                  textOne: 'Welcome to the World\nof News!',
                  textTwo:
                      'Read only fresh and relevant world\nnews collected for you',
                ),
                OnboardingItemWidger(
                  foto: AppImages.onboardingTwo,
                  textOne: 'Receive News\nNotifications',
                  textTwo:
                      'News are updated every day and stay\nup to date with all events',
                ),
                OnboardingItemWidger(
                  foto: AppImages.onboardingThree,
                  textOne: 'Discover Famous\nJournalists',
                  textTwo:
                      'Learn more about famous world\njournalists and their contributions',
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 18,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColorsInsightfulNews.color00B2FF,
                        dotColor: AppColorsInsightfulNews.color00000025,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                    SizedBox(height: 210.h),
                    ButtonWidget(
                      color: AppColorsInsightfulNews.color00B2FF,
                      onPress: () async {
                        if (currantPage == 2) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigatorScreen(),
                            ),
                            (protected) => false,
                          );
                          await FirstOpenInsightfulNews.setFirstOpen();
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      height: 61.h,
                      radius: 12,
                      text: 'Continue',
                    ),
                    SizedBox(height: 30.h),
                    RestoreButtons(
                      onPressTermOfService: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebFFInsightfulNews(
                              title: 'Term of use',
                              url: DocFFInsightfulNews.tUse,
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
                              url: DocFFInsightfulNews.pP,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
