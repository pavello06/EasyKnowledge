import 'package:easy_knowledge/common/presentation/widget/easy_cached_network_image.dart';
import 'package:easy_knowledge/common/presentation/widget/easy_card.dart';
import 'package:easy_knowledge/common/presentation/widget/easy_rating.dart';
import 'package:easy_knowledge/core/theme/t.dart';
import 'package:easy_knowledge/feature/course/presentation/page/course_page.dart';
import 'package:easy_knowledge/feature/home/domain/entity/course_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCourseCard extends StatelessWidget {
  const HomeCourseCard({super.key, required this.course});

  final CoursePreview course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          CoursePage.fullRoute(parent: '', id: course.id!),
        );
      },
      child: EasyCard(
        child: Row(
          spacing: 8.0,
          children: [
            Hero(
              tag: 'course-${course.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: EasyCachedNetworkImage(
                  course.coverUrl,
                  width: 84.0,
                  height: 84.0,
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.0,
                children: [
                  Text(course.name, style: T.titleSmall(context)),

                  SizedBox(
                    height: 20.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          Text(course.topics[index], style: T.bodyMedium(context)),
                      separatorBuilder: (_, _) => const SizedBox(width: 4.0),
                      itemCount: course.topics.length,
                    ),
                  ),

                  EasyRating(rating: course.rating, size: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
