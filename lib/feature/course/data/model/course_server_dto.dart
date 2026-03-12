import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_knowledge/feature/course/data/model/lesson_preview_server_dto.dart';

class CourseServerDto {
  CourseServerDto({
    this.id,
    this.author,
    required this.coverUrl,
    required this.name,
    required this.topics,
    required this.rating,
    required this.publishedAt,
    required this.updatedAt,
    required this.duration,
    this.introUrl,
    required this.description,
    required this.lessons,
  });

  final String? id;
  final dynamic author;
  final String coverUrl;
  final String name;
  final List<String> topics;
  final double rating;
  final Timestamp publishedAt;
  final Timestamp updatedAt;
  final int duration;
  final String? introUrl;
  final String description;
  final List<LessonPreviewServerDto> lessons;

  factory CourseServerDto.fromJson(Map<String, dynamic> json) =>
      CourseServerDto(
        id: json['id'] as String?,
        author: json['author'] as dynamic,
        coverUrl: json['coverUrl'] as String,
        name: json['name'] as String,
        topics: json['topics'] as List<String>,
        rating: (json['rating'] as num).toDouble(),
        publishedAt: json['publishedAt'] as Timestamp,
        updatedAt: json['updatedAt'] as Timestamp,
        duration: json['duration'] as int,
        introUrl: json['introUrl'] as String?,
        description: json['description'] as String,
        lessons: List<LessonPreviewServerDto>.from(
          json['lessons'].map((e) => LessonPreviewServerDto.fromJson(e)),
        ),
      );
}
