import 'package:flutter/material.dart';
import 'package:morpion/utils.dart';

class Case extends StatefulWidget {
  int empty;
  void Function(bool value) onTapped;
  Case({ Key? key, required this.onTapped, required this.empty}) : super(key: key);

  @override
  _CaseState createState() => _CaseState();
}

class _CaseState extends State<Case> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.empty == 0 && !bot){
          player = !player;
          player ? widget.empty = 1 : widget.empty = 2;
          widget.onTapped(player);
          setState((){

          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width/(range*1.185),
        height: MediaQuery.of(context).size.width/(range*1.185),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.black)
        ),
        child:CustomPaint(
          painter: widget.empty == 0 ? null : (widget.empty == 1 ? CircleDrawPaint() : CrossDrawPaint()),
          child: Container()
        )
      )
    );
  }
}

class CrossDrawPaint extends CustomPainter {
  double x = 5;
  double y = 1.185;

  @override
  void paint(Canvas canvas, Size size) {
    Paint crossBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawLine(Offset(size.width/x,  size.height/x),
        Offset(size.width/y, size.height/y), crossBrush);
    canvas.drawLine(
        Offset(size.width/y, size.height/x), Offset(size.width/x, size.height/y), crossBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CircleDrawPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(Offset(size.width/2, size.height/2), size.width/(2.7), paint1);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}