import 'package:flutter_mvvm_api_news/view/others/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_api_news/view/screens/news/components/shimmer_components/image_shwimmer.dart';

class NewsShimmer extends StatelessWidget {
  const NewsShimmer({Key? key, this.animation}) : super(key: key);
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;

    Widget buildContainer() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // image part
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const ImageShwimmer()),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 16,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 14,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 14,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
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
      );
    }

    return animation != null
        ? FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation!),
            child: buildContainer())
        : buildContainer();
  }
}
