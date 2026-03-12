import 'package:easy_knowledge/feature/lesson/config/enum/lesson_element_type.dart';
import 'package:easy_knowledge/feature/lesson/data/model/lesson_element_server_dto.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson_element.dart';

abstract class LessonElementMapper {
  static LessonElement fromServer(LessonElementServerDto dto) {
    return LessonElement(
      id: dto.id,
      type: LessonElementType.values[dto.type],
      content: dto.content,
    );
  }
}
