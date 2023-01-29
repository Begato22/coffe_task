import 'package:decoffee/app.dart';
import 'package:flutter/material.dart';

import 'package:decoffee/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const DeCoffeApp());
}
