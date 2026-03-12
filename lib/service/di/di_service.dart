import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_knowledge/core/network/network_checker.dart';
import 'package:easy_knowledge/feature/course/data/datasource/course_remote_data_source.dart';
import 'package:easy_knowledge/feature/course/data/repository/course_repository_impl.dart';
import 'package:easy_knowledge/feature/course/domain/repository/course_repository.dart';
import 'package:easy_knowledge/feature/course/domain/usecase/get_course.dart';
import 'package:easy_knowledge/feature/course/presentation/bloc/course_cubit.dart';
import 'package:easy_knowledge/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:easy_knowledge/feature/home/data/repository/home_repository_impl.dart';
import 'package:easy_knowledge/feature/home/domain/repository/home_repository.dart';
import 'package:easy_knowledge/feature/home/domain/usecase/get_course_list.dart';
import 'package:easy_knowledge/feature/home/presentation/bloc/home_cubit.dart';
import 'package:easy_knowledge/feature/lesson/data/datasource/lesson_remote_data_source.dart';
import 'package:easy_knowledge/feature/lesson/data/repository/lesson_repository_impl.dart';
import 'package:easy_knowledge/feature/lesson/domain/repository/lesson_repository.dart';
import 'package:easy_knowledge/feature/lesson/domain/usecase/get_lesson.dart';
import 'package:easy_knowledge/feature/lesson/presentation/bloc/lesson_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class DIService {
  static final getIt = GetIt.instance;

  static Future<void> init() async {
    // Utils
    final internetChecker = InternetConnection();
    getIt.registerLazySingleton<NetworkChecker>(
      () => NetworkCheckerImpl(checker: internetChecker),
    );
    getIt.registerLazySingleton(() => FirebaseFirestore.instance);

    // Home
    // Data sources
    getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(firestore: getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        networkChecker: getIt(),
        remoteDataSource: getIt(),
      ),
    );

    // Use cases
    getIt.registerLazySingleton(() => GetCourseList(repository: getIt()));

    // BLoC
    getIt.registerLazySingleton<HomeCubit>(
      () => HomeCubit(getCourseList: getIt()),
    );

    // Course
    // Data sources
    getIt.registerLazySingleton<CourseRemoteDataSource>(
      () => CourseRemoteDataSourceImpl(firestore: getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<CourseRepository>(
      () => CourseRepositoryImpl(
        networkChecker: getIt(),
        remoteDataSource: getIt(),
      ),
    );

    // Use cases
    getIt.registerLazySingleton(() => GetCourse(repository: getIt()));

    // BLoC
    getIt.registerFactoryParam<CourseCubit, String, void>(
      (id, _) => CourseCubit(id: id, getCourse: getIt()),
    );

    // Lesson
    // Data sources
    getIt.registerLazySingleton<LessonRemoteDataSource>(
      () => LessonRemoteDataSourceImpl(firestore: getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<LessonRepository>(
      () => LessonRepositoryImpl(
        networkChecker: getIt(),
        remoteDataSource: getIt(),
      ),
    );

    // Use cases
    getIt.registerLazySingleton(() => GetLesson(repository: getIt()));

    // BLoC
    getIt.registerFactoryParam<LessonCubit, String, String>(
      (courseId, id) =>
          LessonCubit(courseId: courseId, id: id, getLesson: getIt()),
    );
  }
}
