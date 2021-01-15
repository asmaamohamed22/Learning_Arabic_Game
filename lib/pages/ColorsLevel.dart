import 'dart:math';
import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:kidsGame/constant.dart';
import 'package:kidsGame/widgets/move.dart';

class ColorsLevel extends StatefulWidget {
  static String id = 'HomePage';
  @override
  _ColorsLevelState createState() => _ColorsLevelState();
}

class _ColorsLevelState extends State<ColorsLevel> {
  AudioCache _audioController = AudioCache();
  Map<String, bool> score = {};
  Map<String, Widget> choices = {
    '🍓': Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Text(
        'أحمر',
        style: TextStyle(color: Colors.white, fontSize: 23),
      ),
    ),
    '🍏': Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        'أخضر',
        style: TextStyle(color: Colors.white, fontSize: 23),
      ),
    ),
    '🍊': Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        'برتقالي',
        style: TextStyle(color: Colors.white, fontSize: 23),
      ),
    ),
    '🍇': Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        'بنفسجي',
        style: TextStyle(color: Colors.white, fontSize: 23),
      ),
    ),
    '🍌': Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        'أصفر',
        style: TextStyle(color: Colors.white, fontSize: 23),
      ),
    ),
    '🥥': Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        'بني',
        style: TextStyle(color: Colors.white, fontSize: 23),
      ),
    ),
  };
  int index = 0;
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${score.length} / 6  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  ': المجموع',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '-: صل الفاكهة باللون المناسب',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: choices.keys.map((element) {
                    return Expanded(
                      child: Draggable<String>(
                        data: element,
                        child: Movable(score[element] == true ? '✔️' : element),
                        feedback: Movable(element),
                        childWhenDragging: Movable('🌱'),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: choices.keys.map((element) {
                    return _buildTarget(element);
                  }).toList()
                    ..shuffle(Random(index)),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            score.clear();
            index++;
          });
        },
        child: Icon(
          Icons.refresh_outlined,
          color: kBackground,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildTarget(element) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[element] == true) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '👏 أحسنت',
              style: TextStyle(fontSize: 20),
            ),
            alignment: Alignment.center,
            height: 65,
            width: 110,
          );
        } else {
          return Container(
            child: choices[element],
            height: 65,
            width: 110,
          );
        }
      },
      onWillAccept: (data) => data == element,
      onAccept: (data) {
        setState(() {
          score[element] = true;
          _audioController.play('win.mp3');
        });
      },
    );
  }
}
