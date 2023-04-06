import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../common/shimmer_widget.dart';
import '../../../../../const/app_color_const.dart';
import '../../../../../const/app_images.dart';
import '../../../../../utils/datetime_parse.dart';
import '../../../data/model/home_headline_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.e,
  });

  final NewsModel e;

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: screenW,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenW * 0.56,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.description.isEmpty ? e.title : e.description,
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                            color: AppColorConst.appkActiveBlueGrey
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          e.source.name,
                          style: const TextStyle(
                              color: AppColorConst.appkActiveBlueGrey,
                              fontSize: 12),
                        ),
                      ),
                      Text(
                        DateTimeParse().formatDate(e.publishedAt, "MMMM d"),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenW * 0.31),
            child: CachedNetworkImage(
              height: 80,
              imageUrl: e.urlToImage,
              imageBuilder: (context, imageProvider) => Container(
                width: screenW * 0.32,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(e.urlToImage))),
              ),
              placeholder: (context, url) => const ShimmerWidget(
                listCount: 1,
                listHeight: 100,
                height: 100,
              ),
              errorWidget: (context, url, error) => Container(
                width: screenW * 0.312,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(AppImages.imagePlaceforError),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
