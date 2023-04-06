import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../common/shimmer_widget.dart';
import '../../../const/app_color_const.dart';
import '../../../const/app_images.dart';
import '../../../utils/datetime_parse.dart';
import '../../../utils/export.dart';
import '../data/model/home_headline_model.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.e});
  final NewsModel e;
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    String publishDate = DateTimeParse().formatDate(e.publishedAt, "MMMM d, y");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const CircleAvatar(
              backgroundColor: CupertinoColors.systemGrey5,
              child: Icon(CupertinoIcons.back),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            CachedNetworkImage(
              height: screenH * 0.32,
              width: screenW,
              imageUrl: e.urlToImage,
              imageBuilder: (context, imageProvider) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(e.urlToImage))),
              ),
              placeholder: (context, url) => const ShimmerWidget(
                listCount: 1,
                listHeight: 100,
                height: 100,
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(AppImages.imagePlaceforError),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 13),
              child: Text(
                e.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontFamily: "Poppins"),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                // height: screenH * 0.09,
                width: screenW,
                child: ListTile(
                  leading: const CircleAvatar(),
                  title: Text(
                    publishDate,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    e.author.isNotEmpty ? e.author : "Unknown",
                    style: const TextStyle(color: AppColorConst.appGrey),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: CupertinoColors.secondarySystemFill,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      e.source.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                )),
            if (e.description.isNotEmpty)
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Text(
                    e.description * 2,
                    style: const TextStyle(height: 2.1),
                  )),
          ],
        ),
      ),
    );
  }
}
