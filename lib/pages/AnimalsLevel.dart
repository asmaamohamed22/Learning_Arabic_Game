import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:kidsGame/constant.dart';
import 'package:kidsGame/widgets/move.dart';

class AnimalsLevel extends StatefulWidget {
  static String id = 'AnimalsLevel';
  @override
  _AnimalsLevelState createState() => _AnimalsLevelState();
}

class _AnimalsLevelState extends State<AnimalsLevel> {
  AudioCache _audioController = AudioCache();
  Map<String, bool> score = {};
  Map<String, String> choices = {
    '🐈': 'قطة',
    '🦆': 'بطة',
    '🐇': 'أرنب',
    '🐎': 'حصان',
    '🐄': 'بقرة',
    '🐕': 'كلب',
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
                  '-: صل الحيوانات بأسمها المناسب',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
                        childWhenDragging: Movable('🐻'),
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
            decoration: BoxDecoration(
              color: kBackground,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            height: 65,
            width: 110,
            child: Text(
              choices[element],
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
      onWillAccept: (data) => data == element,
      onAccept: (data) {
        setState(() {
          score[element] = true;
          _audioController.play('a7sant.mp3');
        });
      },
    );
  }
}
