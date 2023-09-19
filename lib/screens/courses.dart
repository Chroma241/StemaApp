import 'package:flutter/material.dart';
import 'package:steam/constants.dart';
import 'package:steam/screens/introduction.dart';
import 'ressources.dart';
import 'pdf.dart';
import 'account.dart';
import '../models/user.dart'; // Importez la classe User
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/course_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        ListCourses(),
        InfoPage(),
        AccountPage(),
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        iconSize: 32.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
      ),
    );
  }
}

class ListCourses extends StatefulWidget {
  const ListCourses({Key? key}) : super(key: key);

  @override
  State<ListCourses> createState() => _ListCoursesState();
}

class _ListCoursesState extends State<ListCourses> {
  List<Course> courses = [];
  User? user; // Déclarez l'objet User

  @override
  void initState() {
    super.initState();
    // Récupérez les cours depuis la boîte courseBox au moment de l'initialisation
    courses = Hive.box<Course>('courseBox').values.toList();
    // Récupérez l'objet User depuis la boîte userData
    user = Hive.box<User>('userData')
        .get(0); // Supposons que l'objet User est stocké à l'indice 0
  }

  @override
  Widget build(BuildContext context) {
    print('Longueur de la liste courses : ${courses.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Syllabus',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: "Nexa-Bold"),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Ajoutez le Container ici avant votre CustomScrollView
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Introduction(),
                ),
              );
            },
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

              decoration: BoxDecoration(
                color: mainColor, // Couleur d'arrière-plan du Container
                borderRadius:
                    BorderRadius.circular(10.0), // Ajoutez un BorderRadius
              ), // Couleur d'arrière-plan du Container
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Introduction".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nexa-Bold"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 40,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final course = courses[index];
                      final title = course.title;
                      final pathEN = course.pathEN;
                      final pathFR = course.pathFR;
                      final isFinish = course.isFinish;
                      return Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              title,
                              style: TextStyle(fontFamily: "Nexa-Regular"),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: mainColor,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfCode(
                                    title,
                                    pathEN,
                                    pathFR,
                                    isFinish,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    childCount: courses.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
