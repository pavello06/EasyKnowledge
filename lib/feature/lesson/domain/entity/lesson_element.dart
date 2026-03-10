import 'package:easy_knowledge/feature/lesson/config/enum/lesson_element_type.dart';
import 'package:equatable/equatable.dart';

class LessonElement extends Equatable {
  const LessonElement({required this.type, required this.content});

  final LessonElementType type;
  final String content;

  @override
  List<Object?> get props => [type, content];
}
