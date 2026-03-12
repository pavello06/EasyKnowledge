class CoursePreviewServerDto {
  CoursePreviewServerDto({
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

  factory CoursePreviewServerDto.fromJson(Map<String, dynamic> json) {
    return CoursePreviewServerDto(
      id: json['id'] as String?,
      coverUrl: json['coverUrl'] as String,
      name: json['name'] as String,
      topics: json['topics'] as List<String>,
      rating: json['rating'] as double,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'coverUrl': coverUrl,
    'name': name,
    'topics': topics,
    'rating': rating,
  };
}
