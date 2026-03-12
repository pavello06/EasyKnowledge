import 'package:easy_knowledge/common/presentation/widget/easy_shimmer.dart';
import 'package:easy_knowledge/core/theme/t.dart';
import 'package:flutter/material.dart';

class CourseLoadingContent extends StatelessWidget {
  const CourseLoadingContent({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: 'course-$id',
              child: EasyShimmer(
                child: Container(
                  decoration: BoxDecoration(
                    color: T.tertiary(context),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16.0),
                    ),
                  ),
                  width: double.infinity,
                  height: 250.0,
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16.0)),

          SliverToBoxAdapter(
            child: EasyShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: T.tertiary(context),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: double.infinity,
                height: 66.0,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),

          SliverList.separated(
            itemBuilder: (_, _) => EasyShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: T.tertiary(context),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                width: double.infinity,
                height: 44.0,
              ),
            ),
            separatorBuilder: (_, _) => const SizedBox(height: 8.0),
            itemCount: 10,
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        ],
      ),
    );
  }
}
