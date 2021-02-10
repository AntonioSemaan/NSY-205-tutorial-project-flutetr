import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Table extends StatefulWidget{
  
  String tableNumber;
  Color tableColor;

  Table({this.tableNumber, this.tableColor});

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<Table>{
    
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.tableNumber),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      color: widget.tableColor??Colors.cyan[200],
    );
  }
  
}