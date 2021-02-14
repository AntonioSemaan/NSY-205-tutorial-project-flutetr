import 'package:Restaurant/Globals.dart';
import 'package:Restaurant/entity/RestaurantMenuItem.dart';
import 'package:Restaurant/entity/RestaurantMenuItemOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuTile extends StatefulWidget{
  
  final RestaurantMenuItem menuItem;

  int tableNumber;

  MenuTile(this.menuItem,this.tableNumber);

  @override
  _MenuTileState createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile>{
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(tablesData[widget.tableNumber].containsKey(widget.menuItem.id)){
          tablesData[widget.tableNumber][widget.menuItem.id].quantity++;
        }
        else{
          tablesData[widget.tableNumber][widget.menuItem.id] = RestaurantMenuItemOrder(1, widget.menuItem);
        }
        menuDataChanged.trigger();
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.menuItem.itemName,
                style: TextStyle(fontSize: 18),
              )
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.menuItem.itemDescription,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child:Text(
                widget.menuItem.price.toString()+" \$",
                style: TextStyle(fontSize: 16,color: Colors.red[600]),
              ),
            )
          ],
        )
      ),
    );
  }
}