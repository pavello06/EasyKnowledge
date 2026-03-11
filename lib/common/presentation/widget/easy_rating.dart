import 'dart:math';

import 'package:easy_knowledge/core/theme/t.dart';
import 'package:flutter/material.dart';

class EasyRating extends StatelessWidget {
  const EasyRating({super.key, required this.rating, this.size = 16.0});

  final double rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(5, (index) {
          final double percentage = min(1, max(0, rating - index));

          return _PartialStar(percentage: percentage, size: size);
        }),

        const SizedBox(width: 4.0),

        Text(
          rating.toStringAsFixed(1),
          style: T
              .bodyMedium(context)
              .copyWith(fontSize: size, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _PartialStar extends StatelessWidget {
  const _PartialStar({required this.percentage, required this.size});

  final double percentage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Star(size: size, isFilled: false),

        ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: percentage,
            child: _Star(size: size, isFilled: true),
          ),
        ),
      ],
    );
  }
}

class _Star extends StatelessWidget {
  const _Star({required this.size, required this.isFilled});

  final double size;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: size,
      color: isFilled
          ? T.secondary(context)
          : T.secondary(context).withAlpha(100),
    );
  }
}
