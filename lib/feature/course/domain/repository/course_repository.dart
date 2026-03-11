import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/course/domain/entity/course.dart';

abstract class CourseRepository {
  Future<Either<Failure, Course>> getCourse(String id);
}
