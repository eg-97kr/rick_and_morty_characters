import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: url,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
        placeholder: (context, _) => Shimmer.fromColors(
          baseColor: isDark ? AppColors.grayInactDark : AppColors.gray1Light,
          highlightColor: isDark ? Colors.white : AppColors.bgDark,
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // const SizedBox(
        //   width: 72,
        //   height: 72,
        //   child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        // ),
        errorWidget: (context, url, error) => Container(
          width: 90,
          height: 90,
          color: isDark ? Colors.white : AppColors.bgDark,
          alignment: Alignment.center,
          child: const Icon(Icons.person, size: 32),
        ),
      ),
    );
  }
}
