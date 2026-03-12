import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/course/domain/entity/course.dart';
import 'package:easy_knowledge/feature/course/domain/entity/lesson_preview.dart';
import 'package:easy_knowledge/feature/course/domain/entity/topic.dart';
import 'package:easy_knowledge/feature/course/domain/repository/course_repository.dart';
import 'package:easy_knowledge/feature/lesson/config/enum/lesson_element_type.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson_element.dart';

class CourseRepositoryImpl implements CourseRepository {
  @override
  Future<Either<Failure, Course>> getCourse(String id) async {
    return Right(
      Course(
        id: '0',
        coverUrl:
            'https://yt3.ggpht.com/z__RDfyYYg8jN9i29wfdLZ0gFryAceRZn-zDycqvHGNUmke6QM3vtZx_wR_3xcZFtX6FACWiug=s88-c-k-c0x00ffffff-no-rj',
        name: 'Course1',
        topics: [
          Topic(id: '0', name: '#topic1'),
          Topic(id: '1', name: '#topic2'),
          Topic(id: '2', name: '#topic3'),
        ],
        rating: 4.3,
        publishedAt: DateTime.now(),
        updatedAt: DateTime.now(),
        duration: 0,
        introUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        description: 'Lorem ipsum.',
        lessons: [
          LessonPreview(
            id: '0',
            coverUrl:
                'https://yt3.ggpht.com/z__RDfyYYg8jN9i29wfdLZ0gFryAceRZn-zDycqvHGNUmke6QM3vtZx_wR_3xcZFtX6FACWiug=s88-c-k-c0x00ffffff-no-rj',
            name: 'Lesson1',
            firstTextElement: LessonElement(
              type: LessonElementType.text,
              content: 'Lorem ipsum.',
            ),
          ),
        ],
      ),
    );
  }
}
