import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/news_business_widget.dart';
import 'package:news_app/features/home/presentation/views/news_headline_widget.dart';
import 'package:news_app/features/home/presentation/views/news_sport_widget.dart';
import '../../../common/network notifier/network_handle_widet.dart/network_handler_widget.dart';
import '../../../common/normal_navigation/normal_navigation.dart';
import '../../../const/app_const.dart';
import '../../../utils/export.dart';
import '../../search_news/presentation/searchnews_screen.dart';
import 'controller/business_news_controller.dart';
import 'controller/news_headline_controller.dart';
import 'controller/sport_news_controller.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(businessNewControllerProvider);
        ref.invalidate(newsHeadLineControllerProvider);
        ref.invalidate(sportNewsControllerProvider);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  normalPush(
                      context: context, widget: const SearchNewsScreen());
                },
                icon: const Icon(CupertinoIcons.search))
          ],
          title: const Text(AppConst.kHamroNews),
        ),
        body: NetworkHandler(
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  NewsHeadLineWidget(),
                  NewsBusinesSection(),
                  NewsSportSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
