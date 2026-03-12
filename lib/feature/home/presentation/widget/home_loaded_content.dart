import 'package:easy_knowledge/feature/home/domain/entity/course_preview.dart';
import 'package:easy_knowledge/feature/home/presentation/widget/home_course_card.dart';
import 'package:flutter/material.dart';

class HomeLoadedContent extends StatelessWidget {
  const HomeLoadedContent({super.key, required this.courses});

  final List<CoursePreview> courses;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemBuilder: (_, index) => HomeCourseCard(course: courses[index]),
            separatorBuilder: (_, _) => const SizedBox(height: 16.0),
            itemCount: courses.length,
          ),
        ],
      ),
    );
  }
}
