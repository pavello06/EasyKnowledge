class LessonElementServerDto {
  LessonElementServerDto({this.id, required this.type, required this.content});

  final String? id;
  final int type;
  final String content;

  factory LessonElementServerDto.fromJson(Map<String, dynamic> json) =>
      LessonElementServerDto(
        id: json['id'] as String?,
        type: json['type'] as int,
        content: json['content'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'type': type,
    'content': content,
  };
}
