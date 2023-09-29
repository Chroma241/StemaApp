import 'package:flutter/material.dart';
import 'package:steam/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_url/open_url.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          DropdownButton(
            icon: Icon(
              Icons.arrow_drop_down,
              size: 45,
              color: mainColor,
            ),
            padding: EdgeInsets.all(10),
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
                          'https://play.google.com/store/apps/details?id=com.rosettastone.android.main'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=com.memrise.android.memrisecompanion'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=com.babbel.mobile.android.en'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir le lien : $url';
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
                          'https://play.google.com/store/apps/details?id=org.khanacademy.android'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=org.coursera.android'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=org.edx.mobile'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=com.nearpod.sp'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=com.wallwisher'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=no.mobitroll.kahoot.android'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=seesaw.shadowpuppet.co'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=com.morriscooke.explaineverything'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=com.classdojo.android'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=com.edpuzzle.android'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Book Creator permet aux enseignants et aux étudiants de créer et de publier leurs propres livres électroniques interactifs, ce qui en fait un outil créatif pour les projets d'alphabétisation."
                        : "Book Creator enables teachers and students to create and publish their own interactive ebooks, making it a creative tool for literacy projects."),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://play.google.com/store/apps/details?id=com.redjumper.bookcreator'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
                          'https://play.google.com/store/apps/details?id=com.quizlet.quizletandroid'; // Remplacez par l'URL que vous souhaitez ouvrir.
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
              SizedBox(
                height: 20,
              ),
              Text(
                // Utilisez la langue actuelle pour déterminer le contenu.
                currentLanguage == Language.French
                    ? 'Sites web éducatifs'
                    : 'Educational website',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                child: Text(
                  currentLanguage == Language.French
                      ? "Voici une liste de sites Web éducatifs offrant des ressources précieuses aux éducateurs, notamment du matériel accessible et des modèles téléchargeables en anglais et en français :"
                      : 'Here is a list of educational websites that offer valuable resources for educators, including accessible materials and downloadable templates in both English and French:',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              ExpansionTile(
                title: Text("STEAM-Powered Family"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "STEAM-Powered Family propose des activités, des projets et des plans de cours basés sur STEAM pour les parents et les éducateurs. Ils offrent du contenu en anglais et en français."
                        : "STEAM-Powered Family provides STEAM-based activities, projects, and lesson plans for parents and educators. They offer content in both English and French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.steampoweredfamily.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: true);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("MakeMatic"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Makematic propose une collection de vidéos éducatives, de plans de cours et de ressources liés à STEAM pour les enseignants et les étudiants. Certains contenus sont disponibles en français."
                        : "Makematic offers a collection of STEAM-related educational videos, lesson plans, and resources for teachers and students. Some content is available in French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://makematic.com'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url.toString())) {
                        await launchUrlString(url.toString(),
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("NASA"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "La NASA propose une large gamme de ressources pédagogiques, d'activités et de plans de cours liés aux sciences et technologies spatiales. Certains documents sont disponibles en français."
                        : "NASA offers a wide range of educational resources, activities, and lesson plans related to space science and technology. Some materials are available in French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : principalement l'anglais avec quelques ressources en français"
                        : "Languages: Primarily English with some French resources"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.nasa.gov/forstudents/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Exploratorium"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "L'Exploratorium propose des activités scientifiques et artistiques interactives, des vidéos et des ressources pour les éducateurs. Certains contenus sont disponibles en anglais et en français."
                        : "The Exploratorium provides interactive science and art activities, videos, and resources for educators. Some content is available in both English and French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "principalement l'anglais avec quelques ressources en français"
                        : "Languages: Primarily English with some French resources"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.exploratorium.edu/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("STEAMsational"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "STEAMsational propose des plans de cours, des activités et des ressources STEAM aux enseignants et aux parents. Certains contenus sont disponibles en anglais et en français."
                        : "STEAMsational offers STEAM lesson plans, activities, and resources for teachers and parents. Some content is available in both English and French"),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : principalement l'anglais avec quelques ressources en français"
                        : "Languages: Primarily English with some French resources"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.steamsational.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Teachers Pay Teachers"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Teachers Pay Teachers est une plate-forme sur laquelle les éducateurs peuvent trouver et partager des ressources pédagogiques, des plans de cours et du matériel téléchargeable"
                        : "Teachers Pay Teachers is a platform where educators can find and share teaching resources, lesson plans, and downloadable materials."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.teacherspayteachers.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("TES Resources"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "TES Resources est un site Web de partage de ressources destiné aux éducateurs, proposant une large gamme de matériel pédagogique gratuit et payant, notamment des feuilles de travail, des plans de cours et des modèles."
                        : "TES Resources is a resource-sharing website for educators, offering a wide range of free and paid teaching materials, including worksheets, lesson plans, and templates."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.tes.com/teaching-resources'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Education.com"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Education.com propose une collection de ressources pédagogiques, de feuilles de travail et de matériel imprimable pour les enseignants, les parents et les élèves à la maison."
                        : "Education.com provides a collection of educational resources, worksheets, and printable materials for teachers, parents, and homeschoolers."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.education.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("TeachersFirst"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "TeachersFirst propose une variété de plans de cours, d'unités pédagogiques et de ressources en classe, avec certains matériels disponibles en français."
                        : "TeachersFirst offers a variety of lesson plans, instructional units, and classroom resources, with some materials available in French"),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : principalement l'anglais avec quelques ressources en français"
                        : "Languages: Primarily English with some French resources"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.teachersfirst.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("TESOL"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "TESOL (Teachers of English to Speakers of Other Languages) propose un centre de ressources avec des ressources pédagogiques téléchargeables pour les enseignants de langue anglaise."
                        : "TESOL (Teachers of English to Speakers of Other Languages) offers a resource center with downloadable teaching resources for English language educators."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.tesol.org/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Enchanted Learning"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Enchanted Learning propose du matériel pédagogique, notamment des feuilles de travail et des activités imprimables, en anglais et en français."
                        : "Enchanted Learning offers educational materials, including printable worksheets and activities, in both English and French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.enchantedlearning.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("French Teacher Resources"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "French Teacher Resources fournit du matériel téléchargeable et des plans de cours spécialement conçus pour les enseignants de langue française."
                        : "French Teacher Resources provides downloadable materials and lesson plans specifically designed for French language teachers."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Language: French"
                        : "Languages: French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://frenchteachernet.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("ReadWriteThink"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "ReadWriteThink propose des ressources pédagogiques gratuites et des plans de cours pour les professeurs d'anglais, avec certains supports disponibles en français."
                        : "ReadWriteThink offers free educational resources and lesson plans for English language arts teachers, with some materials available in French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : principalement l'anglais avec quelques ressources en français"
                        : "Languages: Primarily English with some French resources"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'http://www.readwritethink.org/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Google Classroom"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Google Classroom est une plate-forme en ligne qui utilise l'IA pour faciliter la communication, la distribution des devoirs, la notation et la collaboration entre les enseignants et les étudiants."
                        : "Google Classroom is an online platform that uses AI to facilitate communication, assignment distribution, grading, and collaboration among educators and students."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://classroom.google.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Microsoft Education"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Microsoft Education propose divers outils et ressources basés sur l'IA pour les enseignants, notamment Microsoft Teams pour les classes virtuelles et les analyses basées sur l'IA."
                        : "Microsoft Education offers various AI-powered tools and resources for educators, including Microsoft Teams for virtual classrooms and AI-driven analytics."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.microsoft.com/en-us/education'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("IBM Watson Education"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "IBM Watson Education fournit des solutions basées sur l'IA pour l'apprentissage, l'évaluation et l'analyse personnalisés, avec certaines ressources disponibles en français."
                        : "IBM Watson Education provides AI-powered solutions for personalized learning, assessment, and analytics, with some resources available in French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : principalement l'anglais avec quelques ressources en français"
                        : "Languages: Primarily English with some French resources"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.ibm.com/industries/education'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("SMART Learning Suite Online"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "SMART Learning Suite Online intègre des fonctionnalités basées sur l'IA pour des leçons interactives, des évaluations et une collaboration en classe. Certains contenus sont disponibles en français."
                        : "SMART Learning Suite Online"),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : principalement l'anglais avec quelques ressources en français"
                        : "Languages: Primarily English with some French resources"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://education.smarttech.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("ALEKS"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "ALEKS (Assessment and Learning in Knowledge Spaces) est une plateforme d'apprentissage adaptatif alimentée par l'IA qui offre un enseignement personnalisé des mathématiques en anglais et en français."
                        : "ALEKS (Assessment and Learning in Knowledge Spaces) is an AI-powered adaptive learning platform that offers personalized math instruction in English and French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.aleks.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Duolingo for schools"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Duolingo pour les écoles propose des ressources d'apprentissage des langues basées sur l'IA pour les enseignants, leur permettant de suivre les progrès des élèves dans les cours d'anglais et de français."
                        : "Duolingo for Schools offers AI-driven language learning resources for educators, allowing them to monitor student progress in English and French courses."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://schools.duolingo.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Brainly"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Brainly est une plateforme où les étudiants et les enseignants peuvent poser et répondre à des questions académiques à l'aide de l'assistance de l'IA, disponible en anglais et en français."
                        : "Brainly is a platform where students and educators can ask and answer academic questions with the help of AI assistance, available in both English and French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://brainly.com/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Oxford Owl"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Oxford Owl propose des ressources de lecture et de mathématiques basées sur l'IA pour les éducateurs et les parents, avec certains documents disponibles en français."
                        : "Oxford Owl offers AI-driven reading and math resources for educators and parents, with some materials available in French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : principalement l'anglais avec quelques ressources en français"
                        : "Languages: Primarily English with some French resources"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.oxfordowl.co.uk/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Edutopia"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "Edutopia est un blog éducatif de la George Lucas Educational Foundation, proposant une multitude d'articles et de ressources sur les pratiques pédagogiques innovantes."
                        : "Edutopia is an education blog by the George Lucas Educational Foundation, offering a wealth of articles and resources on innovative teaching practices"),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : Anglais et Français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.edutopia.org/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Ted Ed"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "La chaîne YouTube de TED-Ed propose des animations pédagogiques et des cours sur divers sujets, avec certains contenus disponibles en français."
                        : "TED-Ed's YouTube channel features educational animations and lessons on various topics, with some content available in French."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : Francais et anglais"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.youtube.com/user/TEDEducation'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Chaine youtube"
                        : "Youtube channel"),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Reddit"),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  ListTile(
                    title: Text(currentLanguage == Language.French
                        ? "r/Education de Reddit est une communauté en ligne bilingue où les éducateurs et les passionnés discutent de sujets éducatifs, partagent des ressources et posent des questions."
                        : "Reddit's r/Education is a bilingual online community where educators and enthusiasts discuss educational topics, share resources, and ask questions."),
                    subtitle: Text(currentLanguage == Language.French
                        ? "Langues : anglais et français"
                        : "Languages: English and French"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      const url =
                          'https://www.reddit.com/r/education/'; // Remplacez par l'URL que vous souhaitez ouvrir.
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Impossible d\'ouvrir l\'URL : $url';
                      }
                    },
                    child: Text(currentLanguage == Language.French
                        ? "Site internet"
                        : "Website"),
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
