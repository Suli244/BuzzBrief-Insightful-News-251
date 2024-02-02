import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/utils/dsaad/adfafa.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
    required this.onPressTermOfService,
    required this.onPressSupport,
    required this.onPressPrivacyPolicy,
  });

  final Function() onPressTermOfService;
  final Function() onPressSupport;
  final Function() onPressPrivacyPolicy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onPressTermOfService,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: Colors.black.withOpacity(0.60),
                ),
              ),
            ),
            child: Text(
              'Term of Service',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: 'SF',
                color: Colors.black.withOpacity(0.60),
              ),
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          Gdsgsg.lineIcon,
          width: 1.40.w,
          color: Colors.black.withOpacity(0.60),
        ),
        const Spacer(),
        InkWell(
          onTap: onPressSupport,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: Colors.black.withOpacity(0.60),
                ),
              ),
            ),
            child: Text(
              'Support',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: 'SF',
                color: Colors.black.withOpacity(0.60),
              ),
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          Gdsgsg.lineIcon,
          width: 1.40.w,
          color: Colors.black.withOpacity(0.60),
        ),
        const Spacer(),
        InkWell(
          onTap: onPressPrivacyPolicy,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: Colors.black.withOpacity(0.60),
                ),
              ),
            ),
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: 'SF',
                color: Colors.black.withOpacity(0.60),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
