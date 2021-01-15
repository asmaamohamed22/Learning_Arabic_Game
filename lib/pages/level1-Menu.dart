import 'package:flutter/material.dart';
import 'package:kidsGame/constant.dart';
import 'package:kidsGame/pages/ColorsLevel.dart';
import 'package:kidsGame/pages/AnimalsLevel.dart';

class Level1Menu extends StatefulWidget {
  static String id = 'Level1Menu';
  @override
  _Level1MenuState createState() => _Level1MenuState();
}

class _Level1MenuState extends State<Level1Menu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/images/cover.jpg',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 120),
                  child: Text(
                    'المستوي الأول',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ColorsLevel.id);
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black54,
                              spreadRadius: 0.5,
                              offset: Offset(3, 4),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green[300],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                              spreadRadius: 0.3,
                              offset: Offset(5, 3),
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: double.infinity,
                          child: Text(
                            '🌈 الألوان',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.white,
                                  blurRadius: 4,
                                  offset: Offset(1, 2),
                                ),
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 4,
                                  offset: Offset(0.5, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AnimalsLevel.id);
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black54,
                              spreadRadius: 0.5,
                              offset: Offset(3, 4),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.orange[300],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                              spreadRadius: 0.3,
                              offset: Offset(5, 3),
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: double.infinity,
                          child: Text(
                            '🐻 الحيوانات',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 4,
                                  offset: Offset(1, 2),
                                ),
                                Shadow(
                                  color: kBackground,
                                  blurRadius: 4,
                                  offset: Offset(0.5, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
