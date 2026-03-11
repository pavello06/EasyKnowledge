import 'package:easy_knowledge/feature/course/domain/usecase/get_course.dart';
import 'package:easy_knowledge/feature/course/presentation/bloc/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit({required this._id, required this._getCourse})
    : super(CourseInitial());

  final String _id;
  final GetCourse _getCourse;

  Future<void> getCourse() async {
    emit(CourseLoading());

    final courseOrFailure = await _getCourse(_id);

    courseOrFailure.fold(
      (failure) => emit(CourseError(failure: failure)),
      (course) => emit(CourseLoaded(course: course)),
    );
  }
}
