// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:steam/constants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  String lang = 'fr';
  String dropdownValue = 'fr';
  String pathFR = 'pdf/fr/Introduction.pdf';
  String pathEN = 'pdf/en/Introduction.pdf';
  // Définissez une variable pour stocker le chemin du PDF en fonction de la langue
  String selectedPath = '';

  @override
  void initState() {
    super.initState();
    // Initialisez le chemin du PDF avec la langue actuelle
    selectedPath = lang == 'fr' ? pathFR : pathEN;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Introduction",
          style: TextStyle(fontFamily: "Nexa-Regular", color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black87),
        actions: [
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
                selectedPath = lang == 'fr' ? pathFR : pathEN;
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
