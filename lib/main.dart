import 'package:easy_knowledge/core/app/app.dart';
import 'package:easy_knowledge/service/di/get_it.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init();

  runApp(const App());
}
