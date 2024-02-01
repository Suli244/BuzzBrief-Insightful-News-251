import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insightful_news_251/screen/saved_news/saved_category_screen.dart';
import 'package:insightful_news_251/screen/saved_news/saved_hive.dart';
import 'package:insightful_news_251/screen/saved_news/saved_model/saved_model.dart';

const _key = 'saved';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({super.key});

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  late Box<Map<dynamic, dynamic>> box;
  final List imagesList = [
    'https://i.ibb.co/DRNq9c1/1.png',
    'https://i.ibb.co/Ycy56TY/2.png',
    'https://i.ibb.co/fFTfcNd/1.png',
    'https://i.ibb.co/wQbMqTz/1.png',
    'https://i.ibb.co/pJpMXwW/1.png',
    'https://i.ibb.co/ZxZ4wFt/1.png',
  ];

  Future initBox() async {
    if (Hive.isBoxOpen(_key)) {
      box = Hive.box<Map<dynamic, dynamic>>(_key);
    } else {
      box = await Hive.openBox<Map<dynamic, dynamic>>(_key);
    }
    return box;
  }

  @override
  void initState() {
    super.initState();
    initBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: initBox(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Saved News",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(height: 8),
                        const Text("Save interesting news to not lose it",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        InkWell(
                          onTap: () {
                            //       if (isFavorite) {
                            //   SavedHive.deleteData(
                            //       id: widget.index, group: widget.type);
                            // } else {
                            SavedHive.dataToCache(
                                group: 'Business',
                                data: SavedModel(
                                    id: 0,
                                    category: 'Business',
                                    time: '32',
                                    desciption: '23',
                                    title: '3242',
                                    view: 234,
                                    images: 'https://i.ibb.co/Ycy56TY/2.png',
                                    timeAgo: ''));
                            // }
                            // setState(() {
                            //   isFavorite = !isFavorite;
                            // });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ValueListenableBuilder(
                          valueListenable: box.listenable(),
                          builder: (context, value, child) {
                            Map<dynamic, dynamic>? savedList = box.get(_key);
                            Map<String, dynamic> newList = {
                              'All News': [],
                              'Business': [],
                              'Politics': [],
                              'Sports': [],
                              'Travel': [],
                              'Science': [],
                            };
                            savedList?.forEach((key1, value1) {
                              if (value1.isNotEmpty) {
                                newList.forEach((key2, value2) {
                                  print('value1 $value1 value2 $value2');
                                  if (key2 == 'All News') {
                                    newList[key2]?.addAll(value1);
                                  } else {
                                    if (key1 == key2) {
                                      newList[key2]?.addAll(value1);
                                    }
                                  }
                                });
                              }
                            });

                            return MasonryGridView.count(
                              mainAxisSpacing: 32,
                              crossAxisSpacing: 16,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: imagesList.length,
                              crossAxisCount: 2,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SavedCategoryScreen(
                                                list: newList.values
                                                    .toList()[index],
                                                category: newList.keys
                                                    .toList()[index],
                                              )));
                                },
                                child: newList.values.toList()[index] != null
                                    ? Stack(
                                        children: [
                                          Container(
                                              clipBehavior: Clip.antiAlias,
                                              width: ((MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      48) /
                                                  2),
                                              height: ((MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      48) /
                                                  2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.white),
                                              child: _image(newList.values
                                                      .toList()[index]
                                                      .isEmpty
                                                  ? imagesList[index]
                                                  : newList.values
                                                      .toList()[index][0]
                                                      .images)),
                                          Positioned(
                                            left: 10,
                                            bottom: 10,
                                            right: 10,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    newList.keys
                                                        .toList()[index],
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white)),
                                                Text(
                                                  newList.values
                                                      .toList()[index]
                                                      .length
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    : const SizedBox(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24)
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }

  Widget _image(String images) {
    return SizedBox(
      height: ((MediaQuery.of(context).size.width - 68) / 2),
      child: Image.network(
        images,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
