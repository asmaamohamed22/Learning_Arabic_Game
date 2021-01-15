import 'package:flutter/material.dart';
import 'package:kidsGame/pages/Level2Menu.dart';
import 'package:kidsGame/pages/level1-Menu.dart';

class WelcomePage extends StatefulWidget {
  static String id = 'WelcomePage';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحباً بكم ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/icon.png',
                height: size.height * 0.32,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Level1Menu.id);
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green[300],
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
                              color: Colors.green,
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
                                'المستوي الأول',
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
                      height: size.height * 0.06,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Level2Menu.id);
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red[300],
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
                              color: Colors.red,
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
                                'المستوي الثاني',
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
