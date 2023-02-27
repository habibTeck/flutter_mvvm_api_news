import 'package:flutter_mvvm_api_news/model/news/news.dart';
import 'package:flutter_mvvm_api_news/view/others/app_theme.dart';
import 'package:flutter_mvvm_api_news/view/others/constant.dart';
import 'package:flutter_mvvm_api_news/view/others/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'shimmer_components/image_shwimmer.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget(
      {Key? key, this.onClick, required this.artical, required this.animation})
      : super(key: key);
  final Animation<double> animation;
  Function()? onClick;
  Article artical;

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;

    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          splashColor: KPrimaryColor,
          onTap: onClick,
          child: Column(
            children: [
              // image part
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: artical.urlToImage == null
                        ? Shimmer.fromColors(
                            enabled: true,
                            baseColor: AppTheme.baseColor(context),
                            highlightColor: AppTheme.highlightColor(context),
                            child: const ImageShwimmer())
                        : CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.contain,
                            imageUrl: artical.urlToImage ?? "",
                            placeholder: (context, url) => Shimmer.fromColors(
                                enabled: true,
                                baseColor: AppTheme.baseColor(context),
                                highlightColor:
                                    AppTheme.highlightColor(context),
                                child: const ImageShwimmer()),
                            errorWidget: (context, url, error) =>
                                Shimmer.fromColors(
                                    enabled: true,
                                    baseColor: AppTheme.baseColor(context),
                                    highlightColor:
                                        AppTheme.highlightColor(context),
                                    child: const ImageShwimmer()),
                          ),
                  ),
                  Positioned(
                      right: 5,
                      bottom: 5,
                      child: Text(
                        artical.publishedAt ?? "",
                        style: const TextStyle(color: Colors.white),
                      )),
                  Positioned(
                      left: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                            color: Utils(context).color(),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          artical.source?.name ?? "",
                          style: TextStyle(
                              color: Utils(context).color(reverse: true)),
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("${artical.title}", style: AppTheme.text1(context)),
                  const SizedBox(height: 8),
                  Text("${artical.description}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.text3(context)),
                  const SizedBox(height: 16),
                  Container(
                    color: theme
                        ? Colors.white.withOpacity(0.2)
                        : Colors.black.withOpacity(0.2),
                    height: 1,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
