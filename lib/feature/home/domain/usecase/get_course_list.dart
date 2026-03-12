import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/home/domain/entity/course_preview.dart';
import 'package:easy_knowledge/feature/home/domain/repository/home_repository.dart';

class GetCourseList {
  GetCourseList({required this._repository});

  final HomeRepository _repository;

  Future<Either<Failure, List<CoursePreview>>> call() {
    return _repository.getCourseList();
  }
}
