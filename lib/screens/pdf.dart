// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:steam/constants.dart';
import '/models/user.dart';
import '/models/course_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../screens/account.dart';

class PdfCode extends StatefulWidget {
  final String title;
  final String pathEN;
  final String pathFR;
  final bool isFinish;
  PdfCode(this.title, this.pathEN, this.pathFR, this.isFinish);

  @override
  State<PdfCode> createState() => _PdfCodeState();
}

class _PdfCodeState extends State<PdfCode> {
  String lang = 'fr';
  String dropdownValue = 'fr';

  // Définissez une variable pour stocker le chemin du PDF en fonction de la langue
  String selectedPath = '';

  @override
  void initState() {
    super.initState();
    // Initialisez le chemin du PDF avec la langue actuelle
    selectedPath = lang == 'fr' ? widget.pathFR : widget.pathEN;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: "Nexa-Regular", color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black87),
        actions: [
          Visibility(
            visible: !widget.isFinish,
            child: TextButton(
              onPressed: () async {
                final userBox = await Hive.openBox<User>('userData');
                final courseBox = await Hive.openBox<Course>('courseBox');

                if (userBox.isNotEmpty) {
                  final currentUser = userBox.getAt(0);
                  if (currentUser != null) {
                    // Augmentez myProgression de l'utilisateur de 1
                    currentUser.myProgression += 1;
                    userBox.putAt(0, currentUser);
                  }
                }
                if (userBox.isEmpty) {
                  showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Ferme la boîte de dialogue actuelle
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AccountPage())); // Navigue vers 'AccountPage'
                              },
                              child:
                                  Text("Aller a Mon compte / Go to my account"),
                            ),
                          ],
                          title: const Text("ATTENTION"),
                          content: Text(
                              'Vous devez créer un compte / You need to create an account'),
                        )),
                  );
                } else {
                  // Passez isFinish du cours actuellement affiché à true
                  final selectedCourse = courseBox.values.firstWhere(
                    (course) =>
                        course.pathEN == selectedPath ||
                        course.pathFR == selectedPath,
                  );

                  if (selectedCourse != null) {
                    final updatedCourse = Course(
                      title: selectedCourse.title,
                      pathFR: selectedCourse.pathFR,
                      pathEN: selectedCourse.pathEN,
                      isFinish: true, // Mettez à jour isFinish à true
                    );

                    // Créez une liste temporaire de tous les cours
                    final List<Course> allCourses = courseBox.values.toList();

                    // Trouvez l'index du cours actuellement affiché dans la liste
                    final index = allCourses.indexOf(selectedCourse);

                    // Remplacez le cours existant par le cours mis à jour
                    allCourses[index] = updatedCourse;

                    // Effacez la boîte
                    await courseBox.clear();

                    // Ajoutez tous les cours de la liste temporaire à nouveau dans la boîte
                    for (final course in allCourses) {
                      courseBox.add(course);
                    }
                  }

                  setState(() {
                    Navigator.of(context).popAndPushNamed('/');
                  });
                }
              },
              child: Text('Fini / Complete',style:TextStyle(color:Colors.white)),
              style: TextButton.styleFrom(backgroundColor: mainColor),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: DropdownButton(
              value: dropdownValue,
              icon: Icon(
                Icons.arrow_drop_down,
                color: mainColor,
              ),
              items: [
                DropdownMenuItem(
                  value: 'fr',
                  child: Image.asset('icons/flags/png/fr.png',
                      width: 25, package: 'country_icons'),
                ),
                DropdownMenuItem(
                  value: 'en',
                  child: Image.asset('icons/flags/png/gb.png',
                      width: 25, package: 'country_icons'),
                ),
              ],
              onChanged: (value) => setState(() {
                lang = value!;
                dropdownValue = value;

                // Mettez à jour le chemin du PDF en fonction de la langue sélectionnée
                selectedPath = lang == 'fr' ? widget.pathFR : widget.pathEN;
              }),
            ),
          )
        ],
      ),
      body: SafeArea(
        child:
            SfPdfViewer.asset(selectedPath), // Utilisez le chemin sélectionné
      ),
    );
  }
}
