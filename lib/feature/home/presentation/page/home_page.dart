import 'package:easy_knowledge/common/presentation/widget/easy_error_content.dart';
import 'package:easy_knowledge/core/extension/failure_to_message.dart';
import 'package:easy_knowledge/feature/home/presentation/bloc/home_cubit.dart';
import 'package:easy_knowledge/feature/home/presentation/bloc/home_state.dart';
import 'package:easy_knowledge/feature/home/presentation/widget/home_loaded_content.dart';
import 'package:easy_knowledge/feature/home/presentation/widget/home_loading_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = '/';

  static String fullRoute() => route;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.read<HomeCubit>().getCourseList();
              });

              return const HomeLoadingContent();
            } else if (state is HomeLoading) {
              return const HomeLoadingContent();
            } else if (state is HomeLoaded) {
              return HomeLoadedContent(courses: state.courses);
            } else if (state is HomeError) {
              return EasyErrorContent(
                onRetry: () {
                  context.read<HomeCubit>().getCourseList();
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
