import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insightful_news_251/screen/news/models/news_models.dart';
import 'package:insightful_news_251/screen/news/news_cubit/news_cubit.dart';
import 'package:insightful_news_251/screen/notifications/child_pages/notification_detail_page.dart';
import 'package:insightful_news_251/screen/premium/premium.dart';
import 'package:insightful_news_251/screen/saved_news/saved_hive.dart';
import 'package:insightful_news_251/screen/saved_news/saved_model/saved_model.dart';
import 'package:insightful_news_251/utils/dsaad/adfafa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    getPrem();
    super.initState();
  }

  bool isPrem = false;

  getPrem() async {
    final prefs = await SharedPreferences.getInstance();
    isPrem = prefs.getBool('buy') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNewsData('All News'),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: !isPrem
                ? Column(
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
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const Premium(
                                isPrem: true,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff00B2FF),
                          ),
                          child: const Text(
                            'Buy Premium for \$0,99',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'SF Pro Text',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 33),
                    ],
                  )
                : BlocBuilder<NewsCubit, NewsState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const Center(
                            child: CircularProgressIndicator.adaptive()),
                        error: (error) => Center(
                          child: Text(error),
                        ),
                        success: (model) => Column(
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
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'You have ',
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.6000000238418579),
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${model.length} notifications',
                                    style: const TextStyle(
                                      color: Color(0xFF00B2FF),
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' today',
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.6000000238418579),
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: model.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 16);
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return ItemWidget(
                                    model: model[index],
                                    index: index,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
    required this.model,
    required this.index,
  });

  final NewsModel model;
  final int index;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    initIsFavorite();
  }

  initIsFavorite() async {
    isFavorite = await SavedHive.hasData(
      group: widget.model.category,
      id: widget.index,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationDetailPage(
              NotificationModel(
                title: widget.model.title,
                image: widget.model.image,
                ago: widget.model.ago,
                typeOfNotify: widget.model.category,
                des: widget.model.description,
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
                    imageUrl: widget.model.image,
                    placeholder: (context, url) => const SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator.adaptive(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              widget.model.category,
                              style: const TextStyle(
                                color: Color(0xFF00B2FF),
                                fontSize: 10,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              widget.model.read,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            if (isFavorite) {
                              SavedHive.deleteData(
                                  id: widget.index,
                                  group: widget.model.category);
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
                          child: Image.asset(
                            isFavorite
                                ? Gdsgsg.saveCheckMarkiconIcon
                                : Gdsgsg.savedIcon,
                            width: isFavorite ? 15.w : 11.w,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        widget.model.title,
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
                          widget.model.ago,
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
  }
}
