import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:insightful_news_251/screen/famous_journalists/data/models/journalists_model.dart';
import 'package:insightful_news_251/screen/famous_journalists/presentation/cubit/journalist_cubit.dart';
import 'package:insightful_news_251/screen/famous_journalists/presentation/widgets/journalist_detail_page.dart';

class JournalistsPage extends StatefulWidget {
  const JournalistsPage({super.key});
  @override
  State<JournalistsPage> createState() => _JournalistsPageState();
}

class _JournalistsPageState extends State<JournalistsPage> {
  @override
  void initState() {
    super.initState();
    context.read<JournalistCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JournalistCubit, JournalistState>(
        builder: (context, state) {
          return SafeArea(
            child: AnimationLimiter(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Famous Journalists',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Find your favorite journalist',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6000000238418579),
                        fontSize: 16,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    state.when(
                      initial: () {
                        return const SizedBox.shrink();
                      },
                      loading: () {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                              ),
                              const CircularProgressIndicator.adaptive(),
                            ],
                          ),
                        );
                      },
                      success: (models) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: models.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredGrid(
                              columnCount: 14,
                              position: index,
                              delay: const Duration(milliseconds: 90),
                              child: SlideAnimation(
                                verticalOffset: 500.0,
                                child: FadeInAnimation(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(milliseconds: 1500),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              JournalistDetailPage(
                                            model: models[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: JournalistBody(
                                      models[index],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (e) {
                        return Text('Error: $e');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class JournalistBody extends StatelessWidget {
  const JournalistBody(this.model, {super.key});

  final JournalistsMode model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'detail_${model.name}',
          child: Container(
            width: 130,
            height: 130,
            clipBehavior: Clip.hardEdge,
            decoration: const ShapeDecoration(
              shape: OvalBorder(),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: model.image,
              placeholder: (context, url) => const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator.adaptive(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Flexible(
          child: Text(
            model.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Divider(
          color: Colors.black.withOpacity(0.4000000059604645),
        ),
      ],
    );
  }
}
