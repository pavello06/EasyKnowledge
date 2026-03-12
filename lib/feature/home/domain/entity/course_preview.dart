import 'package:equatable/equatable.dart';

class CoursePreview extends Equatable {
  const CoursePreview({
    this.id,
    required this.coverUrl,
    required this.name,
    required this.topics,
    required this.rating,
  });

  final String? id;
  final String coverUrl;
  final String name;
  final List<String> topics;
  final double rating;

  @override
  List<Object?> get props => [id, coverUrl, name, topics, rating];
}
