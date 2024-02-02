import 'package:flutter/material.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget(
      {super.key,
      required this.title,
      required this.onTap,
      required this.top,
      required this.bottom});

  final String title;
  final Function() onTap;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: top, bottom: bottom),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                fontFamily: 'SF',
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
