import 'package:easy_knowledge/common/presentation/widget/easy_error_content.dart';
import 'package:easy_knowledge/core/extension/failure_to_message.dart';
import 'package:easy_knowledge/feature/lesson/presentation/bloc/lesson_cubit.dart';
import 'package:easy_knowledge/feature/lesson/presentation/bloc/lesson_state.dart';
import 'package:easy_knowledge/feature/lesson/presentation/widget/lesson_app_bar.dart';
import 'package:easy_knowledge/feature/lesson/presentation/widget/lesson_loaded_content.dart';
import 'package:easy_knowledge/feature/lesson/presentation/widget/lesson_loading_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  static const route = '/lessons/:lessonId';

  static String routeWithId(String id) => route.replaceFirst(':lessonId', id);

  static String fullRoute({required String id}) => routeWithId(id);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LessonAppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<LessonCubit, LessonState>(
          builder: (context, state) {
            if (state is LessonInitial) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.read<LessonCubit>().getLesson();
              });

              return const SizedBox.shrink();
            } else if (state is LessonLoading) {
              return const LessonLoadingContent();
            } else if (state is LessonLoaded) {
              return LessonLoadedContent(lesson: state.lesson);
            } else if (state is LessonError) {
              return EasyErrorContent(
                onRetry: () {
                  context.read<LessonCubit>().getLesson();
                },
                message: state.failure.message(context),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
