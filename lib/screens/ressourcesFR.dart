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
              Text(
                "Duolingo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                currentLanguage == Language.French
                    ? "Certainement! Voici une liste d’applications mobiles éducatives disponibles en versions anglaise et française, accompagnées de brèves descriptions et de liens :"
                    : 'Description: Duolingo is a popular mobile language learning app that offers courses in English and French, among many other languages.',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () async {
                  const url =
                      'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Impossible d\'ouvrir l\'URL : $url';
                  }
                },
                child: Text(
                  'Duolingo sur Android',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
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
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                "Duolingo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                currentLanguage == Language.French
                    ? "Certainement! Voici une liste d’applications mobiles éducatives disponibles en versions anglaise et française, accompagnées de brèves descriptions et de liens :"
                    : 'Description: Duolingo is a popular mobile language learning app that offers courses in English and French, among many other languages.',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () async {
                  const url =
                      'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Impossible d\'ouvrir l\'URL : $url';
                  }
                },
                child: Text(
                  'Duolingo sur Android',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
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
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                "Duolingo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                currentLanguage == Language.French
                    ? "Certainement! Voici une liste d’applications mobiles éducatives disponibles en versions anglaise et française, accompagnées de brèves descriptions et de liens :"
                    : 'Description: Duolingo is a popular mobile language learning app that offers courses in English and French, among many other languages.',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () async {
                  const url =
                      'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Impossible d\'ouvrir l\'URL : $url';
                  }
                },
                child: Text(
                  'Duolingo sur Android',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
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
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                "Duolingo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                currentLanguage == Language.French
                    ? "Certainement! Voici une liste d’applications mobiles éducatives disponibles en versions anglaise et française, accompagnées de brèves descriptions et de liens :"
                    : 'Description: Duolingo is a popular mobile language learning app that offers courses in English and French, among many other languages.',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () async {
                  const url =
                      'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Impossible d\'ouvrir l\'URL : $url';
                  }
                },
                child: Text(
                  'Duolingo sur Android',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
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
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                "Duolingo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                currentLanguage == Language.French
                    ? "Certainement! Voici une liste d’applications mobiles éducatives disponibles en versions anglaise et française, accompagnées de brèves descriptions et de liens :"
                    : 'Description: Duolingo is a popular mobile language learning app that offers courses in English and French, among many other languages.',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () async {
                  const url =
                      'https://play.google.com/store/apps/details?id=com.duolingo&pli=1'; // Remplacez par l'URL que vous souhaitez ouvrir.
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Impossible d\'ouvrir l\'URL : $url';
                  }
                },
                child: Text(
                  'Duolingo Android',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              // Ajoutez d'autres widgets de contenu en fonction de la langue.
            ],
          ),
        ),
      ),
    );
  }
}
