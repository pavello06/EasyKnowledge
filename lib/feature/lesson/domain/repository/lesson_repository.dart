import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson.dart';

abstract class LessonRepository {
  Future<Either<Failure, Lesson>> getLesson(String courseId,String id);
}
