import 'package:flutter/material.dart';
import 'package:steam/constants.dart';
import 'package:steam/screens/ressourcesFR.dart';

class RessourcesEN extends StatefulWidget {
  @override
  _RessourcesENState createState() => _RessourcesENState();
}

class _RessourcesENState extends State<RessourcesEN> {
  // Ajoutez ici les variables d'état que vous souhaitez utiliser pour mettre à jour le contenu.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ressources',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: "Nexa-Bold"),
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
                size: 40,
                color: Colors.white,
              ),
              items: [
                DropdownMenuItem(
                  value: 'fr',
                  child: Image.asset('icons/flags/png/fr.png',
                      width: 25, package: 'country_icons'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RessourcesFR()),
                    );
                  },
                ),
                DropdownMenuItem(
                  value: 'en',
                  child: Image.asset('icons/flags/png/gb.png',
                      width: 25, package: 'country_icons'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RessourcesEN()),
                    );
                  },
                ),
              ],
              onChanged: (value) => setState(() {}),
            ),
          )
        ],
      ),
    );
  }
}
