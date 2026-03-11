import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_knowledge/core/theme/t.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EasyCachedNetworkImage extends StatelessWidget {
  const EasyCachedNetworkImage(
    this.imageUrl, {
    super.key,
    required this.width,
    required this.height,
  });

  final String? imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      progressIndicatorBuilder: (context, url, progress) =>
          _Placeholder(width: width, height: height, isLoading: true),
      errorWidget: (context, url, error) => _Placeholder(
        width: width,
        height: height,
        child: Icon(
          Icons.photo_size_select_actual_rounded,
          size: (width < height ? width : height) / 4.0,
        ),
      ),
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({
    required this.width,
    required this.height,
    this.child,
    this.isLoading = false,
  });

  final double width;
  final double height;
  final Widget? child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: T.tertiary(context),
          highlightColor: isLoading
              ? T.secondary(context)
              : T.tertiary(context),
          loop: -1,
          child: Container(
            alignment: Alignment.center,
            color: T.tertiary(context),
            width: width,
            height: height,
          ),
        ),

        if (child != null) Center(child: child),
      ],
    );
  }
}
