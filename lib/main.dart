import 'dart:io';
import 'dart:math';

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
  late int xApple;
  late int yApple;
  int snake_size = 1;
  String center_text = "";
  String lost_text = "Game Over sale merde";
  String direction = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    x = 185;
    y = 300;
    createRandowApple();
  }

  dynamic mouvement(String direction){
    switch (direction) {
      case "top":
        {
          if (y > 50) {
            y = y - 2;
            return y;
          }
          else {
            center_text = lost_text;
            return center_text;
          }
        }

      case "bottom":
        {
          if (y < (MediaQuery.of(context).size.height/5)*4-25){
            y = y + 2;
            return y;
          }
          else{
            center_text = lost_text;
            return center_text;
          }
        }

      case "right":
        {
          if (x < MediaQuery.of(context).size.width-20){
            x = x + 2;
            return x;
          }
          else{
            center_text = lost_text;
            return center_text;
          }
        }

      case "left":
        {
            if (x > 0){
              x = x - 2;
              return x;
            }
            else{
              center_text = lost_text;
              return center_text;
            }
        }

      default:
        {
          center_text = "Probleme dans mouvement";
          return center_text;
        }
    }
  }

  void createRandowApple(){
    var rng = Random();
    xApple = rng.nextInt(320)+20;//xMIN=20 xMAX=340
    yApple = rng.nextInt(550)+70;//yMIN=70 yMAX=620
  }

  void checkApple(){
    for(var i = 0; i < 20; i++){
      for(var j = 0; j < 20; j++){
        if ((xApple < x+i && x+i < xApple + 20) && (yApple < y+j && y+j < yApple + 20)){
          setState(() {
            snake_size++;
            createRandowApple();
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Positioned(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      top: 0,
                      child: Container(
                        color: Colors.grey[600],
                      ),
                  ),
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
                        color: Colors.grey[600],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              onPressed: () async {
                                setState(() {
                                  direction = "left";
                                });
                                while(direction == "left"){
                                  await new Future.delayed(const Duration(milliseconds : 10));
                                  setState(() {
                                    mouvement(direction);
                                  });
                                  checkApple();
                                }
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
                                onPressed: () async {
                                  setState(() {
                                    direction = "top";
                                  });
                                  while(direction == "top"){
                                    await new Future.delayed(const Duration(milliseconds : 10));
                                    setState(() {
                                      mouvement(direction);
                                    });
                                    checkApple();
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_upward,
                                  size: 50,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height/14),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    direction = "bottom";
                                  });
                                  while(direction == "bottom"){
                                    await new Future.delayed(const Duration(milliseconds : 10));
                                    setState(() {
                                      mouvement(direction);
                                    });
                                    checkApple();
                                  }
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
                            onPressed: () async {
                              setState(() {
                                direction = "right";
                              });
                              while(direction == "right"){
                                await new Future.delayed(const Duration(milliseconds : 10));
                                setState(() {
                                  mouvement(direction);
                                });
                                checkApple();
                              }
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
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 5)*4 +30,
                    right: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        snake_size.toString(),
                        style: TextStyle(
                          color: Colors.blue,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                  Piece(//tete du snake
                    posX: x,
                    posY: y,
                    // 4
                    size: 20,
                    color: Colors.blue,
                  ),
                  Piece(//pomme
                    posX: xApple,
                    posY: yApple,
                    // 4
                    size: 20,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
    );
  }
}




