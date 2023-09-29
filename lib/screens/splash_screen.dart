// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:steam/screens/courses.dart';
import '../constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Homepage()));
    });
  }

  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                  color: mainColor,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "STEAM",
                    speed: Duration(milliseconds: 300),
                  ),
                ],
              ),
            ),
            Text(
              "EDUCATION TRAINING",
              style: TextStyle(
                  color: mainColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "With the contribution of ",
              style: TextStyle(
                  color: mainColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    "asset/images/PARTNERS-TRANSPARENT.png",
                    width: 330,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
