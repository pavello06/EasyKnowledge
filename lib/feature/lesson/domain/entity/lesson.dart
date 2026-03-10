import 'package:easy_knowledge/feature/lesson/domain/entity/lesson_element.dart';
import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  const Lesson({
    required this.id,
    required this.courseId,
    required this.coverUrl,
    required this.name,
    required this.elements,
  });

  final String id;
  final String courseId;
  final String coverUrl;
  final String name;
  final List<LessonElement> elements;

  @override
  List<Object?> get props => [id, courseId, coverUrl, name, elements];
}
