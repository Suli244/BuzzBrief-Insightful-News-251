import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/screen/notifications/child_pages/notification_detail_page.dart';
import 'package:insightful_news_251/screen/saved_news/saved_hive.dart';
import 'package:insightful_news_251/screen/saved_news/saved_model/saved_model.dart';
import 'package:insightful_news_251/style/app_colors.dart';
import 'package:insightful_news_251/utils/images/app_images.dart';

class SavedCategoryScreen extends StatefulWidget {
  const SavedCategoryScreen({
    super.key,
    required this.list,
    required this.category,
  });
  final List list;
  final String category;

  @override
  State<SavedCategoryScreen> createState() => _SavedCategoryScreenState();
}

class _SavedCategoryScreenState extends State<SavedCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Text(widget.category,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: widget.list.isEmpty
                ? Center(
                    child: Text("There are no saved news in this category yet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6))),
                  )
                : Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: widget.list.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ItemSaved(
                          index: index,
                          list: widget.list,
                          category: widget.category,
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class ItemSaved extends StatefulWidget {
  const ItemSaved({
    super.key,
    required this.index,
    required this.list,
    required this.category,
  });

  final List list;
  final int index;
  final String category;

  @override
  State<ItemSaved> createState() => _ItemSavedState();
}

class _ItemSavedState extends State<ItemSaved> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationDetailPage(
              NotificationModel(
                title: widget.list[widget.index].title,
                image: widget.list[widget.index].images,
                ago: widget.list[widget.index].timeAgo,
                typeOfNotify: widget.category,
                des: widget.list[widget.index].desciption,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColorsInsightfulNews.colorF0F0F4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 80.h,
                  width: 64.w,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.list[widget.index].images,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.w, top: 10.h, bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.list[widget.index].category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'SF',
                            color: AppColorsInsightfulNews.color00B2FF,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // Text(
                        //   list[index].view.toString(),
                        //   style: const TextStyle(
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 12,
                        //     fontFamily: 'SF',
                        //     color: Colors.black,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.list[widget.index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        fontFamily: 'SF',
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.list[widget.index].timeAgo,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'SF',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (isFavorite) {
                  SavedHive.deleteData(
                      id: widget.list[widget.index].id,
                      group: widget.list[widget.index].category);
                } else {
                  SavedHive.dataToCache(
                      group: widget.list[widget.index].category,
                      data: SavedModel(
                          id: widget.list[widget.index].id,
                          time: widget.list[widget.index].timeAgo,
                          category: widget.list[widget.index].category,
                          desciption: widget.list[widget.index].desciption,
                          timeAgo: widget.list[widget.index].timeAgo,
                          title: widget.list[widget.index].title,
                          view: widget.list[widget.index].view,
                          images: widget.list[widget.index].images));
                }
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, right: 14.w),
                child: Image.asset(
                  isFavorite
                      ? AppImages.saveCheckMarkiconIcon
                      : AppImages.savedIcon,
                  width: isFavorite ? 15.w : 11.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
