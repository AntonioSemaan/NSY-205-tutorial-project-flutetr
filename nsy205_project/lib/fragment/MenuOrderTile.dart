import 'package:Restaurant/Globals.dart';
import 'package:Restaurant/entity/RestaurantMenuItem.dart';
import 'package:Restaurant/entity/RestaurantMenuItemOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuOrderTile extends StatefulWidget{
  int tableNumber;
  RestaurantMenuItemOrder menuItemOrder;

  int quantity;

  MenuOrderTile(int tNumber, RestaurantMenuItemOrder mItemOrder){
    menuItemOrder = mItemOrder;
    tableNumber = tNumber;
    quantity = menuItemOrder.quantity;
  }

  @override
  _MenuOrderTileState createState() => _MenuOrderTileState();
}

class _MenuOrderTileState extends State<MenuOrderTile>{
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: (){
            setState(() {
              if(tablesData[widget.tableNumber].containsKey(widget.menuItemOrder.item.id)){
                tablesData[widget.tableNumber][widget.menuItemOrder.item.id].quantity++;
              }
              else{
                tablesData[widget.tableNumber][widget.menuItemOrder.item.id] = RestaurantMenuItemOrder(1, widget.menuItemOrder.item);
              }
              widget.quantity++;
            });
          },
          child: Row(
            children: [
              Expanded(
                  child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.menuItemOrder.item.itemName,
                        style: TextStyle(fontSize: 18),
                      )
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.menuItemOrder.item.itemDescription,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        widget.menuItemOrder.item.price.toString()+" \$",
                        style: TextStyle(fontSize: 16,color: Colors.red[600]),
                      ),
                    )
                  ],
                )
              ),
              Container(

                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.south_outlined
                      ),
                      onTap: (){
                        setState(() {
                          if(tablesData[widget.tableNumber].containsKey(widget.menuItemOrder.item.id)){
                            tablesData[widget.tableNumber][widget.menuItemOrder.item.id].quantity--;
                          }
                          widget.quantity--;
                          if(widget.quantity<=0){
                            tablesData[widget.tableNumber].remove(widget.menuItemOrder.item.id);
                            menuDataChanged.trigger();
                          }
                        });
                      },
                    ),
                    Text(widget.quantity.toString()),
                    GestureDetector(
                      child: Icon(
                        Icons.north_outlined
                      ),
                      onTap: (){
                        setState(() {
                          if(tablesData[widget.tableNumber].containsKey(widget.menuItemOrder.item.id)){
                            tablesData[widget.tableNumber][widget.menuItemOrder.item.id].quantity++;
                          }
                          else{
                            tablesData[widget.tableNumber][widget.menuItemOrder.item.id] = RestaurantMenuItemOrder(1, widget.menuItemOrder.item);
                          }
                          widget.quantity++;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}