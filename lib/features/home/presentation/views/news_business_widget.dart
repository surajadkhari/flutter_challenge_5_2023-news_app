import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_card.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_header_sectionwidget.dart';
import '../../../../common/asyncvalue_widget.dart';
import '../../../../common/normal_navigation/normal_navigation.dart';
import '../../../../const/app_const.dart';
import '../../../../utils/export.dart';
import '../controller/business_news_controller.dart';
import '../newsdetail_screen.dart';

class NewsBusinesSection extends ConsumerWidget {
  const NewsBusinesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsHeadline = ref.watch(businessNewControllerProvider);
    return AsyncValueWidget(
        value: newsHeadline,
        data: (data) {
          // data.shuffle();
          final shuffledData = data.take(4).toList();
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NewSectionTitle(sectionHeader: AppConst.kofInterest),
              Column(
                children: [
                  ...shuffledData.map(
                    (e) => InkWell(
                      onTap: () => normalPush(
                          context: context,
                          widget: NewsDetailScreen(
                            e: e,
                          )),
                      child: NewsCard(e: e),
                    ),
                  )
                ],
              )
            ],
          );
        },
        providerBase: businessNewControllerProvider);
  }
}
