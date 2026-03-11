import 'package:easy_knowledge/core/l10n/s.dart';
import 'package:easy_knowledge/core/theme/t.dart';
import 'package:flutter/material.dart';

class EasyErrorContent extends StatelessWidget {
  const EasyErrorContent({
    super.key,
    required this.onRetry,
    required this.message,
  });

  final VoidCallback onRetry;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16.0,
        children: [
          Text(
            message,
            style: T.titleLarge(context),
            textAlign: TextAlign.center,
          ),

          GestureDetector(
            onTap: onRetry,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: T.tertiary(context),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                S.of(context).easyErrorContentRetry,
                style: T.bodyLarge(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
