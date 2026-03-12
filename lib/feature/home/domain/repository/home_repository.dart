import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/home/domain/entity/course_preview.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CoursePreview>>> getCourseList();
}
