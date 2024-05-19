import 'package:contact_app_firebase/firebase_options.dart';
import 'package:contact_app_firebase/screens/Home.dart';
import 'package:contact_app_firebase/screens/Todo_app_firebase.dart';
import 'package:contact_app_firebase/screens/signinandup/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Todoapp( ),
      debugShowCheckedModeBanner: false,
    );
  }
}
