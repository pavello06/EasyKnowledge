import 'package:easy_knowledge/feature/course/presentation/bloc/course_cubit.dart';
import 'package:easy_knowledge/feature/course/presentation/page/course_page.dart';
import 'package:easy_knowledge/feature/home/presentation/bloc/home_cubit.dart';
import 'package:easy_knowledge/feature/home/presentation/page/home_page.dart';
import 'package:easy_knowledge/feature/lesson/presentation/bloc/lesson_cubit.dart';
import 'package:easy_knowledge/feature/lesson/presentation/page/lesson_page.dart';
import 'package:easy_knowledge/service/di/di_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.route,
      builder: (context, state) {
        return BlocProvider<HomeCubit>.value(
          value: DIService.getIt(),
          child: const HomePage(),
        );
      },
      routes: [
        GoRoute(
          path: CoursePage.route,
          builder: (context, state) {
            final id = state.pathParameters['courseId'] ?? '';
            final currentRoute = state.path!;

            return BlocProvider<CourseCubit>.value(
              value: DIService.getIt(param1: id),
              child: CoursePage(currentRoute: currentRoute, id: id),
            );
          },
          routes: [
            GoRoute(
              path: LessonPage.route,
              builder: (context, state) {
                final id = state.pathParameters['lessonId'] ?? '';
                final currentRoute = state.path!;

                return BlocProvider<LessonCubit>.value(
                  value: DIService.getIt(param1: id),
                  child: LessonPage(currentRoute: currentRoute, id: id),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
  initialLocation: HomePage.fullRoute(),
);
