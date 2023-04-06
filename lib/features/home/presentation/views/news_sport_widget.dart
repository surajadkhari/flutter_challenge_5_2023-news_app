import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_card.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_header_sectionwidget.dart';
import '../../../../common/asyncvalue_widget.dart';
import '../../../../common/normal_navigation/normal_navigation.dart';
import '../../../../const/app_const.dart';
import '../../../../utils/export.dart';
import '../controller/sport_news_controller.dart';
import '../newsdetail_screen.dart';


class NewsSportSection extends ConsumerWidget {
  const NewsSportSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sportNews = ref.watch(sportNewsControllerProvider);
    return AsyncValueWidget(
        value: sportNews,
        data: (data) {
          // data.shuffle();
          final shuffledData = data.take(4).toList();
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NewSectionTitle(
                sectionHeader: AppConst.kBusinessNews,
              ),
              Column(
                children: [
                  ...shuffledData.map(
                    (e) => InkWell(
                      onTap: () => normalPush(
                          context: context,
                          widget: NewsDetailScreen(
                            e: e,
                          )),
                      child: NewsCard(
                        e: e,
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        },
        providerBase: sportNewsControllerProvider);
  }
}
