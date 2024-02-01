import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insightful_news_251/screen/notifications/child_pages/notification_detail_page.dart';
import 'package:insightful_news_251/screen/saved_news/saved_model/saved_model.dart';
import 'package:insightful_news_251/utils/images/app_images.dart';

class SavedCategoryScreen extends StatelessWidget {
  const SavedCategoryScreen({
    super.key,
    required this.list,
    required this.category,
  });
  final List list;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(category,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              list.isEmpty
                  ? Image.asset(
                      AppImages.notificationNoIcon,
                      scale: 3,
                      width: double.infinity,
                    )
                  : Expanded(
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: list.length,
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
                                      title: list[index].title,
                                      image: list[index].images,
                                      ago: list[index].timeAgo,
                                      typeOfNotify: category,
                                      des: list[index].desciption,
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
                                          imageUrl: list[index].images,
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
                                              Expanded(
                                                child: FittedBox(
                                                  child: Text(
                                                    category,
                                                    style: const TextStyle(
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
                                              Expanded(
                                                child: FittedBox(
                                                  child: Text(
                                                    list[index].timeAgo,
                                                    style: const TextStyle(
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
                                                AppImages.saveCheckMarkiconIcon,
                                                scale: 3.7,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          FittedBox(
                                            child: Text(
                                              list[index].desciption,
                                              style: const TextStyle(
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
                                          Flexible(
                                            child: FittedBox(
                                              child: Text(
                                                list[index].timeAgo,
                                                style: const TextStyle(
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
