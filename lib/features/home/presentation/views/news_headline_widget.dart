import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_header_sectionwidget.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_headline_image.dart';
import '../../../../common/asyncvalue_widget.dart';
import '../../../../common/normal_navigation/normal_navigation.dart';
import '../../../../const/app_const.dart';
import '../../../../utils/export.dart';
import '../controller/news_headline_controller.dart';
import '../newsdetail_screen.dart';

class NewsHeadLineWidget extends ConsumerWidget {
  const NewsHeadLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsHeadline = ref.watch(newsHeadLineControllerProvider);
    return AsyncValueWidget(
        value: newsHeadline,
        data: (data) {
          // data.shuffle();
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NewSectionTitle(sectionHeader: AppConst.kHeadline),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...data.map(
                      (e) => InkWell(
                        onTap: () => normalPush(
                            context: context,
                            widget: NewsDetailScreen(
                              e: e,
                            )),
                        child: NewsHeadLineImageWidget(
                          e: e,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
        providerBase: newsHeadLineControllerProvider);
  }
}
