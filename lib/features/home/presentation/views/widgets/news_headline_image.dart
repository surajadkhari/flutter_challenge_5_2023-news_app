import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/shimmer_widget.dart';
import '../../../data/model/home_headline_model.dart';

class NewsHeadLineImageWidget extends StatelessWidget {
  const NewsHeadLineImageWidget({super.key, required this.e});
  final NewsModel e;

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      height: screenH * 0.35,
      width: screenW * 0.45,
      imageUrl: e.urlToImage,
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(e.urlToImage))),
        child: Container(
          width: screenW,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(bottom: 0),
          color: CupertinoColors.black.withOpacity(0.74),
          child: Text(
            e.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            maxLines: 2,
          ),
        ),
      ),
      placeholder: (context, url) => const ShimmerWidget(
        listCount: 1,
        listHeight: 100,
        height: 100,
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
