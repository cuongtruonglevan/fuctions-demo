import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_bros_flutter/my_app.dart';

Future<void> main() async {
  // CUONG.TRUONG on January/03/2022: Ensure that plugin services are initialized before runApp()
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
