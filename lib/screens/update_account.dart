import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccountPageUpdate extends StatefulWidget {
  const AccountPageUpdate({super.key});

  @override
  State<AccountPageUpdate> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPageUpdate> {
  final box = Hive.box<User>('userData');

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Editer / Edit',
            style: TextStyle(
                color: Colors.black87, fontFamily: "Nexa-Bold", fontSize: 25),
          ),
          elevation: 0,
          toolbarHeight: 100,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nom / FirstName'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: surnameController,
                decoration: InputDecoration(labelText: 'Prénom / Given name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: countryController,
                decoration: InputDecoration(labelText: 'Pays/Country'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final surname = surnameController.text;
                final country = countryController.text;

                int myProgression = 0;
                bool isCompleted = false;

                // Récupérez les valeurs actuelles de myProgression et isCompleted
                final existingUser = box.isEmpty ? null : box.getAt(0);

                if (existingUser != null) {
                  myProgression = existingUser.myProgression;
                  isCompleted = existingUser.isCompleted;
                }

                final user = User(
                  name: name,
                  surname: surname,
                  country: country,
                  myProgression: myProgression,
                  isCompleted: isCompleted,
                );

                // Supprimez l'utilisateur existant (s'il y en a un)
                if (!box.isEmpty) {
                  box.deleteAt(0);
                }

                // Ajoutez le nouvel utilisateur
                try {
                  // Ajoutez le nouvel utilisateur
                  box.add(user);

                  nameController.clear();
                  surnameController.clear();
                  countryController.clear();
                } catch (e) {
                  print("Erreur lors de l'ajout de l'utilisateur : $e");
                }
              },
              child: Text('Mettre à jour / Update'),
            ),
          ],
        ));
  }
}
