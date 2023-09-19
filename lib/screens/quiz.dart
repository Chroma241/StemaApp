import 'package:flutter/material.dart';
import 'package:steam/constants.dart';
import 'package:steam/screens/certification.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Question 1',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 2',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 3',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 4',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 5',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 6',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 7',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 8',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 9',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    {
      'question': 'Question 10',
      'options': ['Option A', 'Option B', 'Option C', 'Option D'],
      'correctAnswer': 'Option A',
    },
    // Ajoutez d'autres questions ici...
  ];

  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  void checkAnswer(String selectedOption) {
    String correctAnswer =
        questions[currentQuestionIndex]['correctAnswer'] as String;
    if (selectedOption == correctAnswer) {
      setState(() {
        correctAnswers++;
      });
    }

    // Passer à la question suivante ou terminer le quiz
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Afficher les résultats ou redémarrer le quiz
      showDialog(
        context: context,
        builder: (context) {
          if (correctAnswers == questions.length) {
            // Si le score est de 100%, rediriger vers la page de résultats
            return ResultPage();
          } else {
            // Sinon, afficher la boîte de dialogue de résultats
            return AlertDialog(
              title: Text('Score'),
              content: Text('Score: $correctAnswers / ${questions.length}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Réinitialiser le quiz
                    setState(() {
                      currentQuestionIndex = 0;
                      correctAnswers = 0;
                    });
                  },
                  child: Text('Rejouer'),
                ),
              ],
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz",
          style: TextStyle(fontFamily: "Nexa-Regular", color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nexa-Regular"),
            ),
            SizedBox(height: 8),
            Text(
              questions[currentQuestionIndex]['question'] as String,
              style: TextStyle(fontSize: 16, fontFamily: "Nexa-Regular"),
            ),
            SizedBox(height: 16),
            Column(
              children:
                  (questions[currentQuestionIndex]['options'] as List<String>)
                      .map((option) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    tileColor: mainColor,
                    title: Text(
                      option,
                      style: TextStyle(
                          fontFamily: "Nexa-Regular", color: Colors.white),
                    ),
                    onTap: () {
                      checkAnswer(option);
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: QuizPage(),
  ));
}
