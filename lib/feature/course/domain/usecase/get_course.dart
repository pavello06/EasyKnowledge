import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/course/domain/entity/course.dart';
import 'package:easy_knowledge/feature/course/domain/repository/course_repository.dart';

class GetCourse {
  GetCourse({required this._repository});

  final CourseRepository _repository;

  Future<Either<Failure, Course>> call(String id) {
    return _repository.getCourse(id);
  }
}
