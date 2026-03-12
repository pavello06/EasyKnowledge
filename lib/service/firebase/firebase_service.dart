import 'package:easy_knowledge/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseService {
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
