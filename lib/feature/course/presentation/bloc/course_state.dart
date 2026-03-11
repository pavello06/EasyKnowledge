import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/course/domain/entity/course.dart';
import 'package:equatable/equatable.dart';

sealed class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  const CourseLoaded({
    required this.course,
    this.isLoading = false,
    this.failure,
  });

  final Course course;
  final bool isLoading;
  final Failure? failure;

  @override
  List<Object> get props => [...super.props, course];

  CourseLoaded copyWith({Course? course, bool? isLoading, Failure? failure}) =>
      CourseLoaded(
        course: course ?? this.course,
        isLoading: isLoading ?? this.isLoading,
        failure: failure ?? this.failure,
      );
}

class CourseError extends CourseState {
  const CourseError({required this.failure});

  final Failure failure;

  @override
  List<Object> get props => [...super.props, failure];

  CourseError copyWith({Failure? failure}) =>
      CourseError(failure: failure ?? this.failure);
}
