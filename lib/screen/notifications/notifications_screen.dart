import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insightful_news_251/screen/notifications/child_pages/notification_detail_page.dart';
import 'package:insightful_news_251/utils/dsaad/adfafa.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List notifications = [1, 2, 3, 4, 5, 6, 4, 3, 2, 2, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You have no notifications today',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 16,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Text.rich(
              //   TextSpan(
              //     children: [
              //       TextSpan(
              //         text: 'You have ',
              //         style: TextStyle(
              //           color: Colors.black.withOpacity(0.6000000238418579),
              //           fontSize: 16,
              //           fontFamily: 'SF Pro Text',
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       TextSpan(
              //         text: notifications.isNotEmpty
              //             ? '${notifications.length} notifications'
              //             : 'no notifications',
              //         style: const TextStyle(
              //           color: Color(0xFF00B2FF),
              //           fontSize: 16,
              //           fontFamily: 'SF Pro Text',
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       TextSpan(
              //         text: ' today',
              //         style: TextStyle(
              //           color: Colors.black.withOpacity(0.6000000238418579),
              //           fontSize: 16,
              //           fontFamily: 'SF Pro Text',
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 10),
              notifications.isNotEmpty
                  ? Expanded(
                      child: Image.asset(
                        Gdsgsg.notificationNoIcon,
                        scale: 3,
                        width: double.infinity,
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: notifications.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationDetailPage(
                                    NotificationModel(
                                      title:
                                          'LVMH shares jump over 12% as earnings point to luxury sector resilience',
                                      image:
                                          'https://images.pexels.com/photos/433989/pexels-photo-433989.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                      ago: '1 min ago',
                                      typeOfNotify: 'Bissness',
                                      des: desc,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 327,
                              height: 96,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF0F0F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        right: 12,
                                        left: 8,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl:
                                              'https://images.pexels.com/photos/433989/pexels-photo-433989.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                          placeholder: (context, url) =>
                                              const SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CircularProgressIndicator
                                                .adaptive(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8,
                                        top: 8,
                                        bottom: 8,
                                        left: 0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Expanded(
                                                child: FittedBox(
                                                  child: Text(
                                                    'Business',
                                                    style: TextStyle(
                                                      color: Color(0xFF00B2FF),
                                                      fontSize: 10,
                                                      fontFamily: 'SF Pro Text',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              const Expanded(
                                                child: FittedBox(
                                                  child: Text(
                                                    '4 min read',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontFamily: 'SF Pro Text',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Image.asset(
                                                Gdsgsg.saveCheckMarkiconIcon,
                                                scale: 3.7,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          const FittedBox(
                                            child: Text(
                                              'LVMH shares jump over 12% \nas earnings point to luxury sector ...',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 3,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Flexible(
                                            child: FittedBox(
                                              child: Text(
                                                '2 hours ago',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontFamily: 'SF Pro Text',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
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

String desc =
    'The owner of Louis Vuitton, Moët & Chandon and Hennessy, as well as brands including Givenchy, Bulgari and Sephora, on Thursday night reported sales amounting to 86.15 billion euros (\$93.34 billion) for 2023, exceeding consensus forecasts and equating to 13% organic growth from the previous year. Organic revenue was up 10% in the fourth quarter. The result was boosted in particular by 14% annual growth in the critical fashion and leather goods sector, along with 11% growth in perfumes and cosmetics. Wines and spirits meanwhile posted a 4% decline. The Paris-listed stock provisionally closed Friday’s session nearly 13% higher. “Our performance in 2023 illustrates the exceptional appeal of our Maisons and their ability to spark desire, despite a year affected by economic and geopolitical challenges,” Bernard Arnault, chairman and CEO of LVMH, said in a statement. “While remaining vigilant in the current context, we enter 2024 with confidence, backed by our highly desirable brands and our agile teams.” After a boom during the pandemic, the luxury sector endured a rough end to 2023 as challenging geopolitical and macroeconomic conditions weighed on consumer spending, particularly in the U.S. and China.';
