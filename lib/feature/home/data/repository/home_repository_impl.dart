import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/core/network/network_checker.dart';
import 'package:easy_knowledge/core/safecall/safe_data_source_call.dart';
import 'package:easy_knowledge/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:easy_knowledge/feature/home/data/mapper/course_preview_mapper.dart';
import 'package:easy_knowledge/feature/home/domain/entity/course_preview.dart';
import 'package:easy_knowledge/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this._networkChecker,
    required this._remoteDataSource,
  });

  final NetworkChecker _networkChecker;
  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<CoursePreview>>> getCourseList() async {
    final coursesOrFailure = await safeRemoteDataSourceCall(
      _networkChecker,
      () async {
        final courseDtos = await _remoteDataSource.getCourseList();

        final courses = courseDtos
            .map((e) => CoursePreviewMapper.fromServer(e))
            .toList();

        return courses;
      },
    );

    return coursesOrFailure.fold(
      (failure) => Left(failure),
      (courses) => Right(courses),
    );
  }
}
