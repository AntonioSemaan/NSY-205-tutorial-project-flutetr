import 'package:Restaurant/Globals.dart';
import 'package:Restaurant/entity/RestaurantMenuItemOrder.dart';
import 'package:Restaurant/fragment/MenuOrderTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidingPanel extends StatefulWidget{
  int tableNumber;
  SlidingPanel(this.tableNumber);

  @override
  _SlidingPanelState createState() => _SlidingPanelState();
}

class _SlidingPanelState extends State<SlidingPanel>{

  Function listener;

  @override
  void initState() {
    super.initState();
      listener = (){
      setState(() {
        
      });
    };
    menuDataChanged.addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    menuDataChanged.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:15,bottom: 15),
            child:Text(
              "Current Order",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Divider(
              color: Colors.black,
              thickness: 3,
            )
          ),
          Expanded(
            child:ListView.separated(
              separatorBuilder: (BuildContext context, int index){
                return Divider(
                  color: Colors.black,
                );
              },
              itemCount: tablesData[widget.tableNumber].values.length,
              itemBuilder: (BuildContext context, int index){
                RestaurantMenuItemOrder temp = tablesData[widget.tableNumber].values.elementAt(index);
                return MenuOrderTile(
                  widget.tableNumber,
                  temp,
                );
              },
            )
          ),
        ],
      )
    );
  }
}