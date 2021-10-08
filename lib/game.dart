// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:morpion/case.dart';
import 'package:morpion/drop_item.dart';
import 'package:morpion/minimax.dart';
import 'package:morpion/utils.dart';

// ignore: must_be_immutable

class Morpion extends StatefulWidget {
  const Morpion({ Key? key }) : super(key: key);

  @override
  _MorpionState createState() => _MorpionState();
}

class _MorpionState extends State<Morpion> {

  bool _versus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Morpion", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropItem(
              onModeChanged: (value){
                if(value == 'versus')
                  _versus = true;
                else
                  _versus = false;
                reset(empty);
                setState(() {
                  
                });
              },
              onDimChanged: (value){
                if(value == "3x"){
                  range = 3;
                }
                else if(value == "4x"){
                  range = 4;
                }
                else if(value == "5x"){
                  range = 5;
                }
                reset(empty);
                empty.clear();
                empty = List.generate(range, (_) => List.generate(range, (index) => 0));
                setState(() {
                  
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(range, (i) =>
                  Row(
                    children: List.generate(range, (j) => 
                      Case(
                        empty: empty[i][j],
                        onTapped: (value) async {
                          // ignore: avoid_print
                          value ? empty[i][j] = 1 : empty[i][j] = 2;
                          if(gameOver(i, j, empty)){
                            if(empty[i][j] == 1){
                              showWinDialog(context, _versus ? "Player 1 win" : "You win");
                            }
                            else{
                              showWinDialog(context, "Player 2 win");
                            }
                          }
                          else if(isFull(empty)){
                            showWinDialog(context, "Draw");
                            return;
                          }
                          if(!_versus && !gameOver(i, j, empty)){
                            bot = true;
                            await Future.delayed(const Duration(milliseconds: 500));
                            int temp = 0;
                            print(empty);
                            temp = minimax(empty, false, dim);
                            dim = dim - 1;
                            if(gameOver(index[0], index[1], empty)){
                              if(empty[i][j] == 1){
                                showWinDialog(context, "Computer win");
                              }
                              else{
                                showWinDialog(context, "You win");
                              }
                            }
                            else if(isFull(empty)){
                              showWinDialog(context, "Draw");
                            }
                            index.clear();
                            player = false;
                            bot = false;
                            setState(() {
                              
                            });
                          }
                        },
                      )
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.restart_alt),
        onPressed: (){
          reset(empty);
          setState(() {
            
          });
        },
      ),
    );
  }

  void showWinDialog(BuildContext context, String text){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          content: Container(
            height: 50,
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(text, style: const TextStyle(fontSize: 20),),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("OK", style: TextStyle(fontSize: 20)),
              onPressed:(){
                reset(empty);
                Navigator.of(context).pop();
                setState(() {
                  
                });
              }
            )
          ]
        );
      }
    );
  }
}