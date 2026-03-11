import 'package:easy_knowledge/feature/lesson/config/enum/lesson_element_type.dart';
import 'package:equatable/equatable.dart';

class LessonElement extends Equatable {
  const LessonElement({
    this.id,
    required this.type,
    required this.content,
  });

  final String? id;
  final LessonElementType type;
  final String content;

  @override
  List<Object?> get props => [id, type, content];
}
