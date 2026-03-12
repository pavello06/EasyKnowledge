import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/core/network/network_checker.dart';
import 'package:easy_knowledge/core/safecall/safe_data_source_call.dart';
import 'package:easy_knowledge/feature/lesson/data/datasource/lesson_remote_data_source.dart';
import 'package:easy_knowledge/feature/lesson/data/mapper/lesson_mapper.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson.dart';
import 'package:easy_knowledge/feature/lesson/domain/repository/lesson_repository.dart';

class LessonRepositoryImpl implements LessonRepository {
  LessonRepositoryImpl({required this._networkChecker, required this._remoteDataSource});

  final NetworkChecker _networkChecker;
  final LessonRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Lesson>> getLesson(String courseId, String id) async {
    final lessonOrFailure = await safeRemoteDataSourceCall(_networkChecker, () async {
      final lessonDto = await _remoteDataSource.getLesson(courseId, id);

      final lesson = LessonMapper.fromServer(lessonDto);

      return lesson;
    });

    return lessonOrFailure;
  }
}
