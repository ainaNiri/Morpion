import 'package:flutter/material.dart';

class DropItem extends StatefulWidget {
  void Function(String value) onModeChanged;
  void Function(String value) onDimChanged;
  DropItem({ Key? key , required this.onModeChanged, required this.onDimChanged}) : super(key: key);

  @override
  _DropItemState createState() => _DropItemState();
}

class _DropItemState extends State<DropItem> {
  final List<String> _versusMode = ['versus', 'computer'];
  final List<String> _dimNumber = ['3x', '4x', '5x'];

  String _modeValue = 'versus';
  String _dimValue = '3x';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          DropdownButton<String>(
            elevation: 2,
            value: _modeValue,
            onChanged: (value){
              if(value != null){
                widget.onModeChanged(value);
                setState(() {
                  _modeValue = value;
                });
              }
            },
            items: _versusMode.map((mode) => DropdownMenuItem(
              value: mode,
              child: Text(mode),
            )).toList(),
          ),
          DropdownButton<String>(
            elevation: 2,
            value: _dimValue,
            onChanged: (value){
              if(value != null){
                widget.onDimChanged(value);
                setState(() {
                  _dimValue = value;
                });
              }
            },
            items: _dimNumber.map((dim) => DropdownMenuItem(
              value: dim,
              child: Text(dim),
            )).toList(),
          ),
        ],
      )
    );
  }
}