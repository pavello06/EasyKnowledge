import 'package:easy_knowledge/feature/lesson/data/model/lesson_element_server_dto.dart';

class LessonServerDto {
  LessonServerDto({
    this.id,
    required this.coverUrl,
    required this.name,
    required this.elements,
  });

  final String? id;
  final String coverUrl;
  final String name;
  final List<LessonElementServerDto> elements;

  factory LessonServerDto.fromJson(Map<String, dynamic> json) =>
      LessonServerDto(
        id: json['id'] as String?,
        coverUrl: json['coverUrl'] as String,
        name: json['name'] as String,
        elements: List<LessonElementServerDto>.from(
          (json['elements'] as List).map(
            (e) => LessonElementServerDto.fromJson(e as Map<String, dynamic>),
          ),
        ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'coverUrl': coverUrl,
    'name': name,
    'elements': elements.map((e) => e.toJson()).toList(),
  };
}
