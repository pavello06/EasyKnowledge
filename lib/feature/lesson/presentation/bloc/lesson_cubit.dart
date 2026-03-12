import 'package:easy_knowledge/feature/lesson/domain/usecase/get_lesson.dart';
import 'package:easy_knowledge/feature/lesson/presentation/bloc/lesson_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit({
    required this._courseId,
    required this._id,
    required this._getLesson,
  }) : super(LessonInitial());

  final String _courseId;
  final String _id;
  final GetLesson _getLesson;

  Future<void> getLesson() async {
    emit(LessonLoading());

    final lessonOrFailure = await _getLesson(_courseId, _id);

    lessonOrFailure.fold(
      (failure) => emit(LessonError(failure: failure)),
      (lesson) => emit(LessonLoaded(lesson: lesson)),
    );
  }
}
