import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/core/network/network_checker.dart';
import 'package:easy_knowledge/core/safecall/safe_data_source_call.dart';
import 'package:easy_knowledge/feature/course/data/datasource/course_remote_data_source.dart';
import 'package:easy_knowledge/feature/course/data/mapper/course_mapper.dart';
import 'package:easy_knowledge/feature/course/domain/entity/course.dart';
import 'package:easy_knowledge/feature/course/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  CourseRepositoryImpl({
    required this._networkChecker,
    required this._remoteDataSource,
  });

  final NetworkChecker _networkChecker;
  final CourseRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Course>> getCourse(String id) async {
    final courseOrFailure = await safeRemoteDataSourceCall(
      _networkChecker,
      () async {
        final courseDto = await _remoteDataSource.getCourse(id);

        final course = CourseMapper.fromServer(courseDto);

        return course;
      },
    );

    return courseOrFailure;
  }
}
