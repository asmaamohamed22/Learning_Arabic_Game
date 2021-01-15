import 'package:flutter/material.dart';

class Movable extends StatelessWidget {
  final String emoji;
  Movable(this.emoji);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 90,
        child: Text(
          emoji,
          style: TextStyle(
            color: Colors.black,
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
