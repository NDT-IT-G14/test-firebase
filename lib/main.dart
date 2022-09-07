import 'package:firebase/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'dart:js';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter firebase',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RegisterScreen());
  }
}

class Firebase {
  static initializeApp() {}
}
