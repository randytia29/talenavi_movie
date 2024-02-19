import 'package:flutter/material.dart';

import 'app.dart';
import 'sl.dart' as sl;

Future<void> main() async {
  await sl.init();

  runApp(const MainApp());
}
