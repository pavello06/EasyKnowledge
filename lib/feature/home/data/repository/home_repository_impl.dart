import 'package:dartz/dartz.dart';
import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/home/domain/entity/course_preview.dart';
import 'package:easy_knowledge/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<Failure, List<CoursePreview>>> getCourseList() async {
    return Right([
      CoursePreview(
        id: '0',
        coverUrl: 'https://yt3.ggpht.com/z__RDfyYYg8jN9i29wfdLZ0gFryAceRZn-zDycqvHGNUmke6QM3vtZx_wR_3xcZFtX6FACWiug=s88-c-k-c0x00ffffff-no-rj',
        name: 'Course1',
        topics: ['#topic1', '#topic2', '#topic3'],
        rating: 4.3,
      ),
    ]);
  }
}
