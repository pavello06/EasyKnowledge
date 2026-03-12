import 'package:easy_knowledge/feature/course/data/mapper/lesson_preview_mapper.dart';
import 'package:easy_knowledge/feature/course/data/model/course_server_dto.dart';
import 'package:easy_knowledge/feature/course/domain/entity/course.dart';

abstract class CourseMapper {
  static Course fromServer(CourseServerDto dto) {
    return Course(
      id: dto.id,
      coverUrl: dto.coverUrl,
      name: dto.name,
      topics: dto.topics,
      rating: dto.rating,
      publishedAt: dto.publishedAt.toDate(),
      updatedAt: dto.updatedAt.toDate(),
      duration: dto.duration,
      description: dto.description,
      lessons: dto.lessons
          .map((e) => LessonPreviewMapper.fromServer(e))
          .toList(),
    );
  }
}
