import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuTile extends StatefulWidget{
  
  final String name;
  final String description;
  final double price;

  MenuTile(this.name,this.description,this.price);

  @override
  _MenuTileState createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile>{
  int _quantity=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: (){
            setState(() {
              _quantity++;
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
                        widget.name,
                        style: TextStyle(fontSize: 18),
                      )
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.description,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        widget.price.toString()+" \$",
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
                          _quantity--;
                        });
                      },
                    ),
                    Text(_quantity.toString()),
                    GestureDetector(
                      child: Icon(
                        Icons.north_outlined
                      ),
                      onTap: (){
                        setState(() {
                          _quantity++;
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