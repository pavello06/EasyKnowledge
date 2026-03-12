import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson.dart';
import 'package:easy_knowledge/feature/lesson/domain/repository/lesson_repository.dart';

class GetLesson {
  GetLesson({required this._repository});

  final LessonRepository _repository;

  Future<Either<Failure, Lesson>> call(String courseId, String id) {
    return _repository.getLesson(courseId, id);
  }
}
