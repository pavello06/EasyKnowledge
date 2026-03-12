import 'package:easy_knowledge/feature/home/domain/usecase/get_course_list.dart';
import 'package:easy_knowledge/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this._getCourseList}) : super(HomeInitial());

  final GetCourseList _getCourseList;

  Future<void> getCourseList() async {
    emit(HomeLoading());

    final coursesOrFailure = await _getCourseList();

    if (!isClosed) {
      coursesOrFailure.fold(
        (failure) => emit(HomeError(failure: failure)),
        (courses) => emit(HomeLoaded(courses: courses)),
      );
    }
  }
}
