import 'package:easy_knowledge/feature/course/domain/entity/lesson_preview.dart';
import 'package:easy_knowledge/feature/course/domain/entity/topic.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  const Course({
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
  final List<Topic> topics;
  final double rating;
  final DateTime publishedAt;
  final DateTime updatedAt;
  final int duration;
  final String? introUrl;
  final String description;
  final List<LessonPreview> lessons;

  @override
  List<Object?> get props => [
    id,
    author,
    coverUrl,
    name,
    topics,
    rating,
    publishedAt,
    updatedAt,
    duration,
    introUrl,
    description,
    lessons,
  ];
}
