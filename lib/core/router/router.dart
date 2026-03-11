import 'package:easy_knowledge/feature/lesson/presentation/bloc/lesson_cubit.dart';
import 'package:easy_knowledge/feature/lesson/presentation/page/lesson_page.dart';
import 'package:easy_knowledge/service/di/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: LessonPage.route,
      builder: (context, state) {
        final id = state.pathParameters['lessonId'] ?? '';

        return BlocProvider<LessonCubit>.value(
          value: DI.getIt(param1: id),
          child: const LessonPage(),
        );
      },
    ),
  ],
  initialLocation: LessonPage.fullRoute(id: '0'),
);
