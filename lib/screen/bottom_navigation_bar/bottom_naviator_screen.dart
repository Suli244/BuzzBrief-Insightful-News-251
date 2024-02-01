import 'package:flutter/material.dart';
import 'package:insightful_news_251/screen/famous_journalists/famous_journalists_screen.dart';
import 'package:insightful_news_251/screen/news/news_screen.dart';
import 'package:insightful_news_251/screen/notifications/notifications_screen.dart';
import 'package:insightful_news_251/screen/saved_news/saved_news_screen.dart';
import 'package:insightful_news_251/screen/settings/settings_screen.dart';
import 'package:insightful_news_251/style/app_colors.dart';
import 'package:insightful_news_251/utils/images/app_images.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 18,
        selectedFontSize: 18,
        currentIndex: index,
        onTap: (indexFrom) async {
          setState(() {
            index = indexFrom;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.newsIcon,
              width: 24.50,
              color: AppColorsInsightfulNews.color00000060,
            ),
            activeIcon: Image.asset(
              AppImages.newsIcon,
              color: AppColorsInsightfulNews.color00B2FF,
              width: 24.50,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.famousJournalistsIcon,
              width: 28,
              color: AppColorsInsightfulNews.color00000060,
            ),
            activeIcon: Image.asset(
              AppImages.famousJournalistsIcon,
              color: AppColorsInsightfulNews.color00B2FF,
              width: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.savedNewsIcon,
              width: 19,
              color: AppColorsInsightfulNews.color00000060,
            ),
            activeIcon: Image.asset(
              AppImages.savedNewsIcon,
              color: AppColorsInsightfulNews.color00B2FF,
              width: 19,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.notificationsIcon,
              width: 22,
              color: AppColorsInsightfulNews.color00000060,
            ),
            activeIcon: Image.asset(
              AppImages.notificationsIcon,
              color: AppColorsInsightfulNews.color00B2FF,
              width: 22,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.settingsIcon,
              width: 24.50,
              color: AppColorsInsightfulNews.color00000060,
            ),
            activeIcon: Image.asset(
              AppImages.settingsIcon,
              color: AppColorsInsightfulNews.color00B2FF,
              width: 24.50,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const NewsScreen(),
  const FamousJournalistsScreen(),
  const SavedNewsScreen(),
  const NotificationsScreen(),
  const SettingsScreen(),
];
