import 'package:easy_knowledge/feature/course/presentation/bloc/course_cubit.dart';
import 'package:easy_knowledge/feature/course/presentation/bloc/course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CourseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CourseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(state is CourseLoaded ? state.course.name : '...'),
          actions: [],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
