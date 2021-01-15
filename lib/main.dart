import 'package:flutter/material.dart';
import 'package:kidsGame/pages/ColorsLevel.dart';
import 'package:kidsGame/pages/Level2Menu.dart';
import 'package:kidsGame/pages/level1-Menu.dart';
import 'package:kidsGame/pages/AnimalsLevel.dart';
import 'package:kidsGame/pages/splash.dart';
import 'package:kidsGame/pages/welcome.dart';

void main() {
  runApp(MyGame());
}

class MyGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'Game',
      home: Splash(),
      routes: {
        Splash.id: (context) => Splash(),
        WelcomePage.id: (context) => WelcomePage(),
        Level1Menu.id: (context) => Level1Menu(),
        ColorsLevel.id: (context) => ColorsLevel(),
        AnimalsLevel.id: (context) => AnimalsLevel(),
        Level2Menu.id: (context) => Level2Menu(),
      },
    );
  }
}
