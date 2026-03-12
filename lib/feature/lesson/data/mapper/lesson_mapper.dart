import 'package:easy_knowledge/feature/lesson/data/mapper/lesson_element_mapper.dart';
import 'package:easy_knowledge/feature/lesson/data/model/lesson_server_dto.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson.dart';

abstract class LessonMapper {
  static Lesson fromServer(LessonServerDto dto) {
    return Lesson(
      id: dto.id,
      coverUrl: dto.coverUrl,
      name: dto.name,
      elements: dto.elements
          .map((e) => LessonElementMapper.fromServer(e))
          .toList(),
    );
  }
}
