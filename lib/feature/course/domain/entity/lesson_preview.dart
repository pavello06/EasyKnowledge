import 'package:easy_knowledge/feature/lesson/domain/entity/lesson_element.dart';
import 'package:equatable/equatable.dart';

class LessonPreview extends Equatable {
  const LessonPreview({
    this.id,
    required this.coverUrl,
    required this.name,
    required this.firstTextElement,
  });

  final String? id;
  final String coverUrl;
  final String name;
  final LessonElement firstTextElement;

  @override
  List<Object?> get props => [id, coverUrl, name, firstTextElement];
}
