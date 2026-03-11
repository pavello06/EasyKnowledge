import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/lesson/config/enum/lesson_element_type.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson_element.dart';
import 'package:easy_knowledge/feature/lesson/domain/repository/lesson_repository.dart';

class LessonRepositoryImpl implements LessonRepository {
  @override
  Future<Either<Failure, Lesson>> getLesson(String id) async {
    await Future.delayed(const Duration(seconds: 4));
    return Right(
      Lesson(
        id: '0',
        courseId: '0',
        coverUrl:
            'https://yt3.ggpht.com/z__RDfyYYg8jN9i29wfdLZ0gFryAceRZn-zDycqvHGNUmke6QM3vtZx_wR_3xcZFtX6FACWiug=s88-c-k-c0x00ffffff-no-rj',
        name: 'Lesson1',
        elements: [
          LessonElement(type: LessonElementType.text, content: 'Lorem ipsum.'),

          LessonElement(
            type: LessonElementType.image,
            content:
                'https://yt3.ggpht.com/z__RDfyYYg8jN9i29wfdLZ0gFryAceRZn-zDycqvHGNUmke6QM3vtZx_wR_3xcZFtX6FACWiug=s88-c-k-c0x00ffffff-no-rj',
          ),

          LessonElement(type: LessonElementType.text, content: 'Lorem ipsum.'),

          LessonElement(
            type: LessonElementType.image,
            content:
                'https://yt3.ggpht.com/z__RDfyYYg8jN9i29wfdLZ0gFryAceRZn-zDycqvHGNUmke6QM3vtZx_wR_3xcZFtX6FACWiug=s88-c-k-c0x00ffffff-no-rj',
          ),

          LessonElement(
            type: LessonElementType.video,
            content:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          ),
        ],
      ),
    );
  }
}
