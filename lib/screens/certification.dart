// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<User>('userData');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Score",
          style: TextStyle(
              color: Colors.black87, fontFamily: "Nexa-Bold", fontSize: 30),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Félicitations! / Congratulation',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nexa-Bold"),
              ),
            ),
            Text(
              'Score : 100%',
              style: TextStyle(fontSize: 18, fontFamily: "Nexa-Bold"),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    final firstUser = box.getAt(0);
                    final name = firstUser?.name ?? "Pas d'information";
                    final surname = firstUser?.surname ?? "Pas d'information";
                    try {
                      generatePDF(name, surname);
                    } catch (e) {
                      print('Erreur lors de la génération du PDF : $e');
                    }
                  },
                  child: Text(
                    'Certification',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> generatePDF(String firstName, String lastName) async {
  try {
    final pdf = pw.Document();

    // Chargez l'image depuis le répertoire "assets"
    final ByteData assetByteData = await rootBundle.load(
        'asset/images/certificate.png'); // Correction du chemin de l'actif
    final List<int> assetBytes = assetByteData.buffer.asUint8List();
    final img.Image image = img.decodeImage(Uint8List.fromList(assetBytes))!;

    // Ajoutez le contenu au PDF ici
    pdf.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4.landscape,
        ),
        build: (context) {
          return pw.Stack(
            children: [
              pw.Image(
                pw.MemoryImage(Uint8List.fromList(assetBytes)),
                fit: pw.BoxFit.cover,
              ),
              pw.Center(
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text(
                      '',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(right: 120.0),
                      child: pw.Text(
                        '$lastName $firstName'.toUpperCase(),
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
    final pdfBytes = await pdf.save();

    final output = await getDownloadsDirectory();
    final file = File("${output?.path}/certification.pdf");
    await file.writeAsBytes(pdfBytes);

    // Attendre la fin de l'écriture du fichier PDF

    await OpenFile.open(file.path);
  } catch (e) {
    print('Erreur lors de la génération du PDF : $e');
  }
}
