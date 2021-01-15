import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kidsGame/pages/welcome.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsGame/constant.dart';

class Splash extends StatefulWidget {
  static String id = 'Splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, WelcomePage.id));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/kids.svg',
            height: size.height * 0.3,
            width: size.width * 0.3,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SpinKitThreeBounce(
            size: 45.0,
            color: kBackground,
          ),
        ],
      ),
    );
  }
}
