import 'package:flutter/material.dart';
import 'package:kidsGame/widgets/data.dart';
import 'package:kidsGame/widgets/flipcart.dart';

class Level2Menu extends StatefulWidget {
  static String id = 'Level2Menu';
  @override
  _Level2MenuState createState() => _Level2MenuState();
}

class _Level2MenuState extends State<Level2Menu> {
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
            padding: const EdgeInsets.only(top: 70, bottom: 600),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'المستوي الثاني',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 170, horizontal: 20),
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => _list[index].goto,
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: _list[index].primarycolor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black45,
                                    spreadRadius: 0.5,
                                    offset: Offset(3, 4))
                              ]),
                        ),
                        Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: _list[index].secomdarycolor,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black12,
                                    spreadRadius: 0.3,
                                    offset: Offset(
                                      5,
                                      3,
                                    ))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                _list[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black26,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      ),
                                      Shadow(
                                          color: Colors.green,
                                          blurRadius: 2,
                                          offset: Offset(0.5, 2))
                                    ]),
                              )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: genratestar(_list[index].noOfstar),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> genratestar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}

class Details {
  String name;
  Color primarycolor;
  Color secomdarycolor;
  Widget goto;
  int noOfstar;

  Details(
      {this.name,
      this.primarycolor,
      this.secomdarycolor,
      this.noOfstar,
      this.goto});
}

List<Details> _list = [
  Details(
      name: "سهل",
      primarycolor: Colors.green,
      secomdarycolor: Colors.green[300],
      noOfstar: 1,
      goto: FlipCardGame(Level.Easy)),
  Details(
      name: "متوسط",
      primarycolor: Colors.orange,
      secomdarycolor: Colors.orange[300],
      noOfstar: 2,
      goto: FlipCardGame(Level.Medium)),
  Details(
      name: "صعب",
      primarycolor: Colors.red,
      secomdarycolor: Colors.red[300],
      noOfstar: 3,
      goto: FlipCardGame(Level.Hard))
];
