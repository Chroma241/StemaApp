import 'package:flutter/material.dart';
import 'package:steam/constants.dart';
import 'package:steam/screens/ressourcesEN.dart';
import 'package:url_launcher/url_launcher.dart';

enum Language { French, English }

class RessourcesFR extends StatefulWidget {
  @override
  _RessourcesFRState createState() => _RessourcesFRState();
}

class _RessourcesFRState extends State<RessourcesFR> {
  Language currentLanguage = Language.French;

  String getHeader() {
    // Utilisez la langue actuelle pour déterminer le texte d'en-tête.
    if (currentLanguage == Language.French) {
      return 'Resources';
    } else {
      return 'Ressources';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getHeader(),
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "Nexa-Bold",
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 1,
        actions: [
          Container(
            color: mainColor,
            padding: EdgeInsets.only(right: 10.0),
            child: DropdownButton(
              icon: Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: Colors.white,
              ),
              items: [
                DropdownMenuItem(
                  value: Language.French,
                  child: Image.asset('icons/flags/png/fr.png',
                      width: 25, package: 'country_icons'),
                  onTap: () {
                    setState(() {
                      currentLanguage = Language.French;
                    });
                  },
                ),
                DropdownMenuItem(
                  value: Language.English,
                  child: Image.asset('icons/flags/png/gb.png',
                      width: 25, package: 'country_icons'),
                  onTap: () {
                    setState(() {
                      currentLanguage = Language.English;
                    });
                  },
                ),
              ],
              onChanged: (value) => setState(() {}),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                // Utilisez la langue actuelle pour déterminer le contenu.
                currentLanguage == Language.French
                    ? 'Applications mobiles éducatives'
                    : 'Educational mobile apps',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                child: Text(
                  currentLanguage == Language.French
                      ? "Certainement! Voici une liste d’applications mobiles éducatives disponibles en versions anglaise et française, accompagnées de brèves descriptions et de liens :"
                      : 'Certainly! Here is a list of educational mobile apps available in both English and French versions, along with short descriptions and links:',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              ExpansionTile(
                title: Text("Duolingo"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Duolingo est une application mobile d'apprentissage des langues populaire qui propose des cours en anglais et en français, parmi de nombreuses autres langues."
                        : "Duolingo is a popular mobile language learning app that offers courses in English and French, among many other languages."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Rosetta Stone"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Rosetta Stone propose des expériences d'apprentissage des langues immersives en anglais et en français via son application mobile."
                        : "Rosetta Stone provides immersive language learning experiences in both English and French through its mobile app."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Memrise"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Memrise est une plateforme d'apprentissage des langues avec une application mobile qui propose des cours d'anglais et de français, axés sur le vocabulaire et la prononciation."
                        : "Memrise is a language learning platform with a mobile app that offers English and French courses, focusing on vocabulary and pronunciation."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Babbel"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Babbel propose des cours de langue complets en anglais et en français via son application mobile, conçue pour aider les utilisateurs à communiquer."
                        : "Babbel offers comprehensive language courses in both English and French through its mobile app, designed to help users become conversational."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Khan Academy"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Khan Academy propose du contenu éducatif gratuit en mathématiques, en sciences et dans diverses autres matières via son application mobile, disponible en anglais et en français."
                        : "Khan Academy provides free educational content in math, science, and various other subjects through its mobile app, available in both English and French."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Coursera"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Coursera propose des cours en ligne provenant d'universités et d'institutions du monde entier, accessibles via son application mobile, disponible en anglais et en français."
                        : "Coursera offers online courses from universities and institutions worldwide, accessible through its mobile app, available in both English and French."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("edX"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "edX est une autre plateforme de cours en ligne, proposant un large éventail de sujets via son application mobile, souvent disponible en anglais et en français."
                        : "edX is another platform for online courses, offering a wide range of subjects through its mobile app, often available in both English and French."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("NearPod"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Nearpod est un outil de classe interactif qui permet aux enseignants de créer des leçons attrayantes avec du contenu multimédia, des quiz et des sondages."
                        : "Nearpod is an interactive classroom tool that allows teachers to create engaging lessons with multimedia content, quizzes, and polls."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Padlet"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Padlet est un tableau d'affichage virtuel où les enseignants et les étudiants peuvent collaborer en partageant des idées, des images et des vidéos."
                        : "Padlet is a virtual bulletin board where teachers and students can collaborate by sharing ideas, images, and videos."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Kahoot!"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Kahoot ! est une plateforme d'apprentissage ludique qui permet aux enseignants de créer des quiz, des enquêtes et des défis pour impliquer les élèves de manière amusante et interactive."
                        : "Kahoot! is a game-based learning platform that allows teachers to create quizzes, surveys, and challenges to engage students in a fun and interactive way."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Seesaw"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Seesaw est un portfolio numérique et un outil de gestion de classe qui permet aux enseignants de capturer et de partager l'apprentissage des élèves avec les parents."
                        : "Seesaw is a digital portfolio and classroom management tool that enables teachers to capture and share student learning with parents."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Explain Everything"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Explain Everything est une application de tableau blanc interactif qui permet aux enseignants de créer des leçons dynamiques avec des dessins, des animations et des éléments multimédias."
                        : "Explain Everything is an interactive whiteboard app that allows teachers to create dynamic lessons with drawings, animations, and multimedia elements."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("ClassDojo"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "ClassDojo est une application de communication en classe qui aide les enseignants et les parents à rester connectés en partageant des mises à jour, des photos et des rapports de comportement."
                        : "ClassDojo is a classroom communication app that helps teachers and parents stay connected by sharing updates, photos, and behavior reports."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Edpuzzle"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Edpuzzle permet aux enseignants de transformer des vidéos en leçons interactives en ajoutant des questions et des commentaires, ce qui en fait un outil attrayant pour l'apprentissage à distance."
                        : ": Edpuzzle allows teachers to turn videos into interactive lessons by adding questions and comments, making it an engaging tool for remote learning."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Book creator"),
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Book Creator permet aux enseignants et aux étudiants de créer et de publier leurs propres livres électroniques interactifs, ce qui en fait un outil créatif pour les projets d'alphabétisation."
                        : "Book Creator enables teachers and students to create and publish their own interactive ebooks, making it a creative tool for literacy projects."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Quizlet"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Quizlet propose une variété d'outils d'étude, notamment des flashcards, des quiz et des jeux, qui peuvent être créés et partagés par les enseignants et les élèves."
                        : "Quizlet offers a variety of study tools, including flashcards, quizzes, and games, which can be created and shared by teachers and students."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Veuillez noter que la disponibilité et les fonctionnalités de l'application peuvent varier selon la région et changer au fil du temps. Pour télécharger ces applications, vous pouvez les rechercher dans la boutique d'applications de votre appareil."
                        : "Please note that app availability and features may vary by region and may change over time. To download these apps, you can search for them in your device's app store."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Application android"
                        : "Android App"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
