import 'package:flutter/material.dart';
import 'piece.dart';

void main() => runApp(MaterialApp(
  home: Snake(),
));

class Snake extends StatefulWidget {
  const Snake({Key? key}) : super(key: key);

  @override
  _SnakeState createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  late int x;
  late int y;
  String center_text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    x = 185;
    y = 300;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Positioned(
                      child: Center(
                        child: Text(
                          center_text,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                  ),
                  Positioned(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width,
                    top: (MediaQuery.of(context).size.height / 5)*4,
                    child: Container(
                        color: Colors.grey[300],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (x > 0){
                                    x = x - 10;
                                  }
                                  else{
                                    setState(() {
                                      center_text = "Game Over sale merde";
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 50,
                              ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/5,),
                          Column(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (y > 0){
                                      y = y - 10;
                                    }
                                    else{
                                      setState(() {
                                        center_text = "Game Over sale merde";
                                      });
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_upward,
                                  size: 50,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height/14),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (y < (MediaQuery.of(context).size.height/5)*4-25){
                                      y = y + 10;
                                    }
                                    else{
                                      setState(() {
                                        center_text = "Game Over sale merde";
                                      });
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_downward,
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width/5,),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (x < MediaQuery.of(context).size.width-20){
                                  x = x + 10;
                                }
                                else{
                                  setState(() {
                                    center_text = "Game Over sale merde";
                                  });
                                }
                              });
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                      ),
                  ),
                  Piece(
                    posX: x,
                    posY: y,
                    // 4
                    size: 20,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
    );
  }
}






