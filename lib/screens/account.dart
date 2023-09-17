// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../models/user.dart';
import 'update_account.dart';
import '/models/course_model.dart';
import 'quiz.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<User>(
        'userData'); // Assurez-vous d'utiliser la bonne boîte ici
    final courseBox = Hive.box<Course>('courseBox');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontFamily: "Nexa-Bold",
              fontSize: 30),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountPageUpdate(),
                  ),
                );
              },
              icon: Icon(
                Icons.edit,
                color: Colors.black87,
              ))
        ],
      ),
      body: ValueListenableBuilder<Box<User>>(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) {
            print("box is empty");
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Color(0xfffa6900),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountPageUpdate(),
                        ),
                      );
                    },
                    child: Text('Créer votre profil/ Create your profile'),
                  ),
                ],
              ),
            );
          } else {
            for (int i = 0; i < courseBox.length; i++) {
              final course = courseBox.getAt(i);
              if (course != null) {
                print(
                    'Course at index $i: ${course.title}, ${course.pathFR}, ${course.pathEN}, ${course.isFinish}');
              }
            }
            final firstUser = box.getAt(0);
            final name = firstUser?.name ?? "Pas d'information";
            final surname = firstUser?.surname ?? "Pas d'information";
            final country = firstUser?.country ?? "Pas d'information";
            final progression = firstUser?.myProgression;
            var isCompleted = firstUser?.isCompleted ?? "Pas d'information";
            bool isVisible = false;
            if (progression == courseBox.length) {
              isCompleted = true;
            }
            if (isCompleted == false) {
              isVisible = false;
            } else {
              isVisible = true;
            }

            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: SimpleCircularProgressBar(
                      maxValue: courseBox.length.toDouble(),
                      valueNotifier: ValueNotifier(progression!.toDouble()),
                      startAngle: progression.toDouble(),
                      animationDuration: 1,
                      backColor: Colors.grey.shade500,
                      progressColors: const [
                        Color(0xd1e03d00),
                        Color(0xfffa6900)
                      ],
                      onGetText: (double value) {
                        TextStyle centerTextStyle = TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nexa-Bold",
                            color: Colors.orange);
                        return Text(
                          '${(progression / courseBox.length * 100).toStringAsFixed(1)}%',
                          style: centerTextStyle,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: AutoSizeText(
                      name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Nexa-Bold"),
                      minFontSize: 5,
                      maxFontSize: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 7,
                    ),
                    child: AutoSizeText(
                      surname,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Nexa-Bold"),
                      minFontSize: 5,
                      maxFontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pays/Country',
                    style: TextStyle(fontFamily: "Nexa-Bold"),
                  ),
                  AutoSizeText(
                    country,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    minFontSize: 5,
                    maxFontSize: 15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                      visible: isVisible,
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          child: Text("Quiz"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizPage(),
                              ),
                            );
                          },
                        ),
                      )),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
