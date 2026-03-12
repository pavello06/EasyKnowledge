import 'package:easy_knowledge/common/presentation/widget/easy_card.dart';
import 'package:easy_knowledge/common/presentation/widget/easy_shimmer.dart';
import 'package:flutter/material.dart';

class HomeLoadingContent extends StatelessWidget {
  const HomeLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverList.separated(
            itemBuilder: (_, _) => const EasyShimmer(
              child: EasyCard(
                child: SizedBox(width: double.infinity, height: 84.0),
              ),
            ),
            separatorBuilder: (_, _) => const SizedBox(height: 16.0),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
