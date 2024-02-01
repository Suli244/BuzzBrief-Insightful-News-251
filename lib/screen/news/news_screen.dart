import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/screen/news/news_cubit/news_cubit.dart';
import 'package:insightful_news_251/screen/news/news_dateil_screen.dart';
import 'package:insightful_news_251/screen/news/widget/reading_time_widget.dart';
import 'package:insightful_news_251/screen/news/widget/tapbar_item_widget.dart';
import 'package:insightful_news_251/style/app_colors.dart';
import 'package:insightful_news_251/utils/images/app_images.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final tabList = [
    'All News',
    'Business',
    'Politics',
    'Sports',
    'Travel',
    'Science',
  ];
  String selectTab = 'All News';
  bool isSavee = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNewsData(selectTab),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const Text(
                  'News',
                  style: TextStyle(
                    height: 0,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    fontFamily: 'SF',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Read the latest world news',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'SF',
                    color: AppColorsInsightfulNews.color00000060,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => const Center(
                          child: CircularProgressIndicator.adaptive()),
                      error: (error) => Center(
                        child: Text(error),
                      ),
                      success: (modelList) => ListView(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDateilScreen(
                                    model: modelList.first,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    height: 327.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          modelList.first.image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    height: 327.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.transparent,
                                          Colors.black,
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isSavee = !isSavee;
                                                });
                                              },
                                              child: Image.asset(
                                                isSavee
                                                    ? AppImages.saveNewsTwoIcon
                                                    : AppImages.saveNewsIcon,
                                                width: 26.w,
                                                height: 26.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        ReadingTimeWidget(
                                          categoryName:
                                              modelList.first.category,
                                          time: modelList.first.read,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          modelList.first.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            fontFamily: 'SF',
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              modelList.first.ago,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                fontFamily: 'SF',
                                                color: Colors.white
                                                    .withOpacity(0.80),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          SingleChildScrollView(
                            padding: const EdgeInsets.only(left: 24),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: tabList
                                  .map<Widget>(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectTab = e;
                                          });
                                          context
                                              .read<NewsCubit>()
                                              .getNewsData(selectTab);
                                        },
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                            color: selectTab == e
                                                ? AppColorsInsightfulNews
                                                    .color00B2FF
                                                : Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            fontFamily: 'SF',
                                            decoration: selectTab == e
                                                ? TextDecoration.underline
                                                : null,
                                            decorationColor: selectTab == e
                                                ? AppColorsInsightfulNews
                                                    .color00B2FF
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ListView.separated(
                              padding: const EdgeInsets.only(bottom: 20),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => TapBarItemWidget(
                                index: index,
                                model: modelList[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
                              itemCount: modelList.length,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
