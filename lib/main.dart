import 'package:easy_knowledge/core/app/app.dart';
import 'package:easy_knowledge/service/di/di_service.dart';
import 'package:easy_knowledge/service/firebase/firebase_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseService.init();
  await DIService.init();

  runApp(const App());
}
