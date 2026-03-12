import 'package:easy_knowledge/common/presentation/widget/easy_error_content.dart';
import 'package:easy_knowledge/core/extension/failure_to_message.dart';
import 'package:easy_knowledge/feature/course/presentation/bloc/course_cubit.dart';
import 'package:easy_knowledge/feature/course/presentation/bloc/course_state.dart';
import 'package:easy_knowledge/feature/course/presentation/widget/course_app_bar.dart';
import 'package:easy_knowledge/feature/course/presentation/widget/course_loaded_content.dart';
import 'package:easy_knowledge/feature/course/presentation/widget/course_loading_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key, required this.currentRoute, required this.id});

  final String currentRoute;
  final String id;

  static const route = '/courses/:courseId';

  static String routeWithId(String id) => route.replaceFirst(':courseId', id);

  static String fullRoute({required String parent, required String id}) =>
      '$parent${routeWithId(id)}';

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourseAppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseInitial) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.read<CourseCubit>().getCourse();
              });

              return CourseLoadingContent(id: widget.id,);
            } else if (state is CourseLoading) {
              return CourseLoadingContent(id: widget.id,);
            } else if (state is CourseLoaded) {
              return CourseLoadedContent(
                route: widget.currentRoute,
                course: state.course,
              );
            } else if (state is CourseError) {
              return EasyErrorContent(
                onRetry: () {
                  context.read<CourseCubit>().getCourse();
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
