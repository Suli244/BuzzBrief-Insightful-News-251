import 'package:flutter/material.dart';
import 'package:insightful_news_251/screen/famous_journalists/data/models/journalists_model.dart';

class JournalistDetailPage extends StatelessWidget {
  const JournalistDetailPage({super.key, required this.model});

  final JournalistsMode model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: MySliverAppBar(
              model: model,
              expandedHeight: 200,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: (16 + model.name.length).toDouble()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    model.bio,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  MySliverAppBar({
    required this.expandedHeight,
    required this.model,
  });

  final double expandedHeight;
  final JournalistsMode model;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Hero(
          tag: 'detail_${model.name}',
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model.image, scale: 3.5),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.white.withOpacity(0.5)],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.01),
                Colors.white.withOpacity(0.1),
              ],
            ),
          ),
        ),
        SafeArea(
          child: IconButton(
            splashRadius: 1,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: SizedBox(
              height: expandedHeight,
              width: MediaQuery.of(context).size.width / 2,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  model.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF00B2FF),
                    fontSize: 28,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
