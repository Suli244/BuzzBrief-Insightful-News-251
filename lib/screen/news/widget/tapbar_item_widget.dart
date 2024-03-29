import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/dsfadfad/asdfas.dart';
import 'package:insightful_news_251/screen/news/models/news_models.dart';
import 'package:insightful_news_251/screen/news/news_dateil_screen.dart';
import 'package:insightful_news_251/screen/saved_news/saved_hive.dart';
import 'package:insightful_news_251/screen/saved_news/saved_model/saved_model.dart';
import 'package:insightful_news_251/utils/dsaad/adfafa.dart';

class TapBarItemWidget extends StatefulWidget {
  const TapBarItemWidget({
    super.key,
    required this.model,
    required this.index,
  });
  final NewsModel model;
  final int index;

  @override
  State<TapBarItemWidget> createState() => _TapBarItemWidgetState();
}

class _TapBarItemWidgetState extends State<TapBarItemWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    initIsFavorite();
  }

  initIsFavorite() async {
    isFavorite =
        await SavedHive.hasData(group: widget.model.category, id: widget.index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDateilScreen(
              model: widget.model,
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
                    imageUrl: widget.model.image,
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
                          widget.model.category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'SF',
                            color: AppColorsInsightfulNews.color00B2FF,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          widget.model.read,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'SF',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.model.title,
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
                      widget.model.ago,
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
                      id: widget.index, group: widget.model.category);
                } else {
                  SavedHive.dataToCache(
                      group: widget.model.category,
                      data: SavedModel(
                          id: widget.index,
                          time: widget.model.ago,
                          category: widget.model.category,
                          desciption: widget.model.description,
                          timeAgo: widget.model.ago,
                          title: widget.model.title,
                          view: widget.model.read,
                          images: widget.model.image));
                }
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, right: 14.w),
                child: Image.asset(
                  isFavorite ? Gdsgsg.saveCheckMarkiconIcon : Gdsgsg.savedIcon,
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
