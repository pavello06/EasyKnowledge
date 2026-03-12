import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_knowledge/feature/home/data/model/course_preview_server_dto.dart';

abstract class HomeRemoteDataSource {
  Future<List<CoursePreviewServerDto>> getCourseList();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required this._firestore});

  final FirebaseFirestore _firestore;

  @override
  Future<List<CoursePreviewServerDto>> getCourseList() async {
    final snapshot = await _firestore.collection('courses').get();

    return snapshot.docs.map((doc) {
      final data = Map<String, dynamic>.from(doc.data());
      data['id'] = doc.id;

      return CoursePreviewServerDto.fromJson(data);
    }).toList();
  }
}
