import 'package:easy_knowledge/feature/lesson/data/model/lesson_element_server_dto.dart';

class LessonPreviewServerDto {
  LessonPreviewServerDto({
    this.id,
    required this.coverUrl,
    required this.name,
    required this.firstTextElement,
  });

  final String? id;
  final String coverUrl;
  final String name;
  final LessonElementServerDto firstTextElement;

  factory LessonPreviewServerDto.fromJson(Map<String, dynamic> json) =>
      LessonPreviewServerDto(
        id: json['id'] as String?,
        coverUrl: json['coverUrl'] as String,
        name: json['name'] as String,
        firstTextElement: LessonElementServerDto.fromJson(
          json['firstTextElement'],
        ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'coverUrl': coverUrl,
    'name': name,
    'firstTextElement': firstTextElement.toJson(),
  };
}
