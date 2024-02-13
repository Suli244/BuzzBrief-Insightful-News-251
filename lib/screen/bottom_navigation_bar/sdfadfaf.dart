import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insightful_news_251/dsfadfad/asdfas.dart';
import 'package:insightful_news_251/screen/afasfasf/sdadfs_scren.dart';
import 'package:insightful_news_251/screen/famous_journalists/presentation/cubit/journalist_cubit.dart';
import 'package:insightful_news_251/screen/famous_journalists/presentation/pages/journalists_page.dart';
import 'package:insightful_news_251/screen/news/news_screen.dart';
import 'package:insightful_news_251/screen/notifications/notifications_screen.dart';
import 'package:insightful_news_251/screen/saved_news/saved_news_screen.dart';
import 'package:insightful_news_251/utils/dsaad/adfafa.dart';

class GFEdgsrgsd extends StatefulWidget {
  const GFEdgsrgsd({Key? key}) : super(key: key);

  @override
  State<GFEdgsrgsd> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<GFEdgsrgsd> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JournalistCubit(),
      child: Scaffold(
        body: pages[index],
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 15,
          selectedFontSize: 15,
          currentIndex: index,
          onTap: (indexFrom) async {
            setState(() {
              index = indexFrom;
            });
            // final prefs = await SharedPreferences.getInstance();
            // await prefs.clear();
            // log('data: clearing ');
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                Gdsgsg.newsIcon,
                width: 24.50,
                color: AppColorsInsightfulNews.color00000060,
              ),
              activeIcon: Image.asset(
                Gdsgsg.newsIcon,
                color: AppColorsInsightfulNews.color00B2FF,
                width: 24.50,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                Gdsgsg.famousJournalistsIcon,
                width: 28,
                color: AppColorsInsightfulNews.color00000060,
              ),
              activeIcon: Image.asset(
                Gdsgsg.famousJournalistsIcon,
                color: AppColorsInsightfulNews.color00B2FF,
                width: 28,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                Gdsgsg.savedNewsIcon,
                width: 19,
                color: AppColorsInsightfulNews.color00000060,
              ),
              activeIcon: Image.asset(
                Gdsgsg.savedNewsIcon,
                color: AppColorsInsightfulNews.color00B2FF,
                width: 19,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                Gdsgsg.notificationsIcon,
                width: 22,
                color: AppColorsInsightfulNews.color00000060,
              ),
              activeIcon: Image.asset(
                Gdsgsg.notificationsIcon,
                color: AppColorsInsightfulNews.color00B2FF,
                width: 22,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                Gdsgsg.settingsIcon,
                width: 24.50,
                color: AppColorsInsightfulNews.color00000060,
              ),
              activeIcon: Image.asset(
                Gdsgsg.settingsIcon,
                color: AppColorsInsightfulNews.color00B2FF,
                width: 24.50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const NewsScreen(),
  const JournalistsPage(),
  const SavedNewsScreen(),
  const NotificationsScreen(),
  const SettingsScreen(),
];
