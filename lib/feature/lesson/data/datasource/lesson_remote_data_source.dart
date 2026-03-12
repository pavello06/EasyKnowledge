import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_knowledge/feature/lesson/data/model/lesson_server_dto.dart';

abstract class LessonRemoteDataSource {
  Future<LessonServerDto> getLesson(String courseId, String id);
}

class LessonRemoteDataSourceImpl implements LessonRemoteDataSource {
  LessonRemoteDataSourceImpl({required this._firestore});

  final FirebaseFirestore _firestore;

  @override
  Future<LessonServerDto> getLesson(String courseId, String id) async {
    final lessonFuture = _firestore
        .collection('courses')
        .doc(courseId)
        .collection('lessons')
        .doc(id)
        .get();
    final elementsFuture = _firestore
        .collection('courses')
        .doc(courseId)
        .collection('lessons')
        .doc(id)
        .collection('elements')
        .get();

    final lessonDoc = await lessonFuture;
    final elementsSnapshot = await elementsFuture;

    final lessonData = Map<String, dynamic>.from(lessonDoc.data()!);
    lessonData['id'] = lessonDoc.id;
    final elements = elementsSnapshot.docs.map((doc) {
      final elementData = Map<String, dynamic>.from(doc.data());

      elementData['id'] = doc.id;

      return elementData;
    }).toList();
    lessonData['elements'] = elements;

    return LessonServerDto.fromJson(lessonData);
  }
}
