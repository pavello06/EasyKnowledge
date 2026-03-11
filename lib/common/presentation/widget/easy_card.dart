import 'package:easy_knowledge/core/theme/t.dart';
import 'package:flutter/material.dart';

class EasyCard extends StatelessWidget {
  const EasyCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: T.tertiary(context),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: child,
    );
  }
}