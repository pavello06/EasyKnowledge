import 'package:easy_knowledge/feature/lesson/data/repository/lesson_repository_impl.dart';
import 'package:easy_knowledge/feature/lesson/domain/repository/lesson_repository.dart';
import 'package:easy_knowledge/feature/lesson/domain/usecase/get_lesson.dart';
import 'package:easy_knowledge/feature/lesson/presentation/bloc/lesson_cubit.dart';
import 'package:get_it/get_it.dart';

abstract class DI {
  static final getIt = GetIt.instance;

  static Future<void> init() async {
    // Utils

    // Lesson
    // Data sources

    // Repositories
    getIt.registerLazySingleton<LessonRepository>(() => LessonRepositoryImpl());

    // Use cases
    getIt.registerLazySingleton(() => GetLesson(repository: getIt()));

    // BLoC
    getIt.registerFactoryParam<LessonCubit, String, void>(
      (id, _) => LessonCubit(id: id, getLesson: getIt()),
    );
  }
}
