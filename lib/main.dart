// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:steam/models/course_model.dart';
import 'package:steam/screens/splash_screen.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('userData');
  Hive.registerAdapter(CourseAdapter());
  final boxExist = await Hive.boxExists('courseBox');

  if (!boxExist) {
    final courseBox = await Hive.openBox<Course>('courseBox');
    final coursesToAdd = [
      Course(
          title: 'Chap 1',
          pathFR: 'pdf/fr/Chap1.pdf',
          pathEN: 'pdf/en/Chap1.pdf',
          isFinish: false),
      Course(
          title: 'Chap 2',
          pathFR: 'pdf/fr/Chap2.pdf',
          pathEN: 'pdf/en/Chap2.pdf',
          isFinish: false),
      Course(
          title: 'Chap 3',
          pathFR: 'pdf/fr/Chap3.pdf',
          pathEN: 'pdf/en/Chap3.pdf',
          isFinish: false),
      Course(
          title: 'Chap 4',
          pathFR: 'pdf/fr/Chap4.pdf',
          pathEN: 'pdf/en/Chap4.pdf',
          isFinish: false),
      Course(
          title: 'Chap 5',
          pathFR: 'pdf/fr/Chap5.pdf',
          pathEN: 'pdf/en/Chap5.pdf',
          isFinish: false),
      Course(
          title: 'Chap 6',
          pathFR: 'pdf/fr/Chap6.pdf',
          pathEN: 'pdf/en/Chap6.pdf',
          isFinish: false),
      Course(
          title: 'Chap 7',
          pathFR: 'pdf/fr/Chap7.pdf',
          pathEN: 'pdf/en/Chap7.pdf',
          isFinish: false),
      Course(
          title: 'Chap 8',
          pathFR: 'pdf/fr/Chap8.pdf',
          pathEN: 'pdf/en/Chap8.pdf',
          isFinish: false),
      Course(
          title: 'Chap 9',
          pathFR: 'pdf/fr/Chap9.pdf',
          pathEN: 'pdf/en/Chap9.pdf',
          isFinish: false),
      Course(
          title: 'Chap 10',
          pathFR: 'pdf/fr/Chap10.pdf',
          pathEN: 'pdf/en/Chap10.pdf',
          isFinish: false),
    ];

    for (final course in coursesToAdd) {
      courseBox.add(course);
    }

    print("Course Box Created"); // Correction du message
  } else {
    final courseBox = await Hive.openBox<Course>('courseBox');
    print("Course Box Exists"); // Correction du message
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<User>('userData');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STEAM APP',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Color.fromARGB(255, 255, 122, 27),
            ),
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
