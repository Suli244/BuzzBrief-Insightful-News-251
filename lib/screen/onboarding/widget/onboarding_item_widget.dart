import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/dsfadfad/asdfas.dart';

class OnboardingItemWidger extends StatelessWidget {
  const OnboardingItemWidger({
    super.key,
    required this.foto,
    required this.textOne,
    required this.textTwo,
  });
  final String foto;
  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Image.asset(
            foto,
            width: 375.w,
            height: 342.h,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 75.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  textOne,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    fontFamily: 'SF',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.h),
              FittedBox(
                child: Text(
                  textTwo,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontFamily: 'SF',
                    color: AppColorsInsightfulNews.color00000060,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
