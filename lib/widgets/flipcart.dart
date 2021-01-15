import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsGame/constant.dart';
import 'data.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';

class FlipCardGame extends StatefulWidget {
  static String id = 'FlipCard';
  final Level _level;
  FlipCardGame(this._level);
  @override
  _FlipCardGameState createState() => _FlipCardGameState(_level);
}

class _FlipCardGameState extends State<FlipCardGame> {
  _FlipCardGameState(this._level);
 AudioCache _audioController = AudioCache();
  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  bool _wait = false;
  Level _level;
  Timer _timer;
  int _time = 5;
  int _left;
  bool _isFinished;
  List<String> _data;

  List<bool> _cardFlips;
  List<GlobalKey<FlipCardState>> _cardStateKeys;

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(4.0),
      child: Image.asset(_data[index]),
    );
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  void restart() {
    startTimer();
    _data = getSourceArray(
      _level,
    );
    _cardFlips = getInitialItemState(_level);
    _cardStateKeys = getCardStateKeys(_level);
    _time = 5;
    _left = (_data.length ~/ 2);

    _isFinished = false;
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _start = true;
        _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isFinished
        ? Scaffold(
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
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        restart();
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kBackground,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        "ألعب مرة أخري",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 950,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          'assets/images/cover.jpg',
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _time > 0
                              ? Text(
                                  '$_time',
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              : Text(
                                  'المتبقي : $_left',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) => _start
                                ? FlipCard(
                                    key: _cardStateKeys[index],
                                    onFlip: () {
                                      if (!_flip) {
                                        _flip = true;
                                        _previousIndex = index;
                                      } else {
                                        _flip = false;
                                        if (_previousIndex != index) {
                                          if (_data[_previousIndex] !=
                                              _data[index]) {
                                            _wait = true;

                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 1500), () {
                                              _cardStateKeys[_previousIndex]
                                                  .currentState
                                                  .toggleCard();
                                              _previousIndex = index;
                                              _cardStateKeys[_previousIndex]
                                                  .currentState
                                                  .toggleCard();

                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 160), () {
                                                setState(() {
                                                  _wait = false;
                                                });
                                              });
                                            });
                                          } else {
                                            _cardFlips[_previousIndex] = false;
                                            _cardFlips[index] = false;
                                            print(_cardFlips);

                                            setState(() {
                                              _left -= 1;
                                                _audioController.play('a7sant.mp3');
                                            });
                                            if (_cardFlips
                                                .every((t) => t == false)) {
                                              print("Won");
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 160), () {
                                                setState(() {
                                                  _isFinished = true;
                                                  _start = false;
                                                   //_audioController.play('clap.mp3');
                                                });
                                              });
                                            }
                                          }
                                        }
                                      }
                                     setState(() {});
                                    },
                                    flipOnTouch:
                                        _wait ? false : _cardFlips[index],
                                    direction: FlipDirection.HORIZONTAL,
                                    front: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 3,
                                              spreadRadius: 0.8,
                                              offset: Offset(2.0, 1),
                                            )
                                          ]),
                                      margin: EdgeInsets.all(4.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/images/quest.jpg",
                                        ),
                                      ),
                                    ),
                                    back: getItem(index))
                                : getItem(index),
                            itemCount: _data.length,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
