import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/lesson/domain/entity/lesson.dart';
import 'package:equatable/equatable.dart';

sealed class LessonState extends Equatable {
  const LessonState();

  @override
  List<Object> get props => [];
}

class LessonInitial extends LessonState {}

class LessonLoading extends LessonState {}

class LessonLoaded extends LessonState {
  const LessonLoaded({
    required this.lesson,
    this.isLoading = false,
    this.failure,
  });

  final Lesson lesson;
  final bool isLoading;
  final Failure? failure;

  @override
  List<Object> get props => [...super.props, lesson];

  LessonLoaded copyWith({Lesson? lesson, bool? isLoading, Failure? failure}) =>
      LessonLoaded(
        lesson: lesson ?? this.lesson,
        isLoading: isLoading ?? this.isLoading,
        failure: failure ?? this.failure,
      );
}

class LessonError extends LessonState {
  const LessonError({required this.failure});

  final Failure failure;

  @override
  List<Object> get props => [...super.props, failure];

  LessonError copyWith({Failure? failure}) =>
      LessonError(failure: failure ?? this.failure);
}
