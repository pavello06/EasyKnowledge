import 'package:easy_knowledge/core/error/failure.dart';
import 'package:easy_knowledge/feature/home/domain/entity/course_preview.dart';
import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded({
    required this.courses,
    this.isLoading = false,
    this.failure,
  });

  final List<CoursePreview> courses;
  final bool isLoading;
  final Failure? failure;

  @override
  List<Object> get props => [...super.props, courses];

  HomeLoaded copyWith({
    List<CoursePreview>? courses,
    bool? isLoading,
    Failure? failure,
  }) => HomeLoaded(
    courses: courses ?? this.courses,
    isLoading: isLoading ?? this.isLoading,
    failure: failure ?? this.failure,
  );
}

class HomeError extends HomeState {
  const HomeError({required this.failure});

  final Failure failure;

  @override
  List<Object> get props => [...super.props, failure];

  HomeError copyWith({Failure? failure}) =>
      HomeError(failure: failure ?? this.failure);
}
