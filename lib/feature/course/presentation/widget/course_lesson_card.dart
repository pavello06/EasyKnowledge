import 'package:easy_knowledge/common/presentation/widget/easy_cached_network_image.dart';
import 'package:easy_knowledge/common/presentation/widget/easy_card.dart';
import 'package:easy_knowledge/core/theme/t.dart';
import 'package:easy_knowledge/feature/course/domain/entity/lesson_preview.dart';
import 'package:easy_knowledge/feature/lesson/presentation/page/lesson_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseLessonCard extends StatelessWidget {
  const CourseLessonCard({
    super.key,
    required this.route,
    required this.lesson,
  });

  final String route;
  final LessonPreview lesson;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          LessonPage.fullRoute(
            parent: route,
            id: lesson.id!,
          ),
        );
      },
      child: EasyCard(
        child: Row(
          spacing: 8.0,
          children: [
            Hero(
              tag: 'lesson-${lesson.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: EasyCachedNetworkImage(
                  lesson.coverUrl,
                  width: 64.0,
                  height: 64.0,
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.0,
                children: [
                  Text(lesson.name, style: T.titleSmall(context)),

                  Text(
                    lesson.firstTextElement.content,
                    style: T.bodyMedium(context),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
