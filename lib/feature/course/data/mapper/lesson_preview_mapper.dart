import 'package:easy_knowledge/feature/course/data/model/lesson_preview_server_dto.dart';
import 'package:easy_knowledge/feature/course/domain/entity/lesson_preview.dart';
import 'package:easy_knowledge/feature/lesson/data/mapper/lesson_element_mapper.dart';

abstract class LessonPreviewMapper {
  static LessonPreview fromServer(LessonPreviewServerDto dto) {
    return LessonPreview(
      id: dto.id,
      coverUrl: dto.coverUrl,
      name: dto.name,
      firstTextElement: LessonElementMapper.fromServer(dto.firstTextElement),
    );
  }
}
