import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/dsfadfad/asdfas.dart';

class ReadingTimeWidget extends StatelessWidget {
  const ReadingTimeWidget({
    super.key,
    required this.categoryName,
    required this.time,
  });
  final String categoryName;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24.h,
          width: 64.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorsInsightfulNews.color00B2FF,
          ),
          child: Center(
            child: Text(
              categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: 'SF',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            fontFamily: 'SF',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
