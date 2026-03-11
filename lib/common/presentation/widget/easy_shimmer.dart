import 'package:easy_knowledge/core/theme/t.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EasyShimmer extends StatelessWidget {
  const EasyShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: T.tertiary(context),
      highlightColor: T.secondary(context),
      loop: -1,
      child: child,
    );
  }
}
