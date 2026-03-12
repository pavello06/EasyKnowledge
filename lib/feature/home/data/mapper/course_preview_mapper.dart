import 'package:easy_knowledge/feature/home/data/model/course_preview_server_dto.dart';
import 'package:easy_knowledge/feature/home/domain/entity/course_preview.dart';

abstract class CoursePreviewMapper {
  static CoursePreview fromServer(CoursePreviewServerDto dto) {
    return CoursePreview(
      id: dto.id,
      coverUrl: dto.coverUrl,
      name: dto.name,
      topics: dto.topics,
      rating: dto.rating,
    );
  }
}
