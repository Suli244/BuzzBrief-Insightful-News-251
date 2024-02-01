import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/utils/images/app_images.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                'News',
                style: TextStyle(
                  fontSize: 28.h,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'SF Pro Text',
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Read the latest world news',
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: 'SF Pro Text',
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                height: 327.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.savedIcon,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
