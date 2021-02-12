import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RestaurantTable extends StatefulWidget{
  
  final String tableNumber;
  final Color tableColor;

  RestaurantTable({this.tableNumber, this.tableColor});

  @override
  _RestaurantTableState createState() => _RestaurantTableState();
}

class _RestaurantTableState extends State<RestaurantTable>{
    
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: 150.0,
        child: Center(
          child: Text(widget.tableNumber),
        ),
        decoration: BoxDecoration(
          color: widget.tableColor??Colors.cyan[200],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
      ),
    );
  }
  
}