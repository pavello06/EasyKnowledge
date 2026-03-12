import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_knowledge/feature/course/data/model/course_server_dto.dart';

abstract class CourseRemoteDataSource {
  Future<CourseServerDto> getCourse(String id);
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  CourseRemoteDataSourceImpl({required this._firestore});

  final FirebaseFirestore _firestore;

  @override
  Future<CourseServerDto> getCourse(String id) async {
    final courseFuture = _firestore.collection('courses').doc(id).get();
    final lessonsFuture = _firestore
        .collection('courses')
        .doc(id)
        .collection('lessons')
        .get();

    final courseDoc = await courseFuture;
    final lessonsSnapshot = await lessonsFuture;

    final courseData = Map<String, dynamic>.from(courseDoc.data()!);
    courseData['id'] = courseDoc.id;
    final lessons = lessonsSnapshot.docs.map((doc) {
      final lessonData = Map<String, dynamic>.from(doc.data());

      lessonData['id'] = doc.id;

      return lessonData;
    }).toList();
    courseData['lessons'] = lessons;

    return CourseServerDto.fromJson(courseData);
  }
}
