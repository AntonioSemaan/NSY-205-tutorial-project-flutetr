import 'package:Restaurant/Globals.dart';
import 'package:Restaurant/entity/RestaurantMenuItem.dart';
import 'package:Restaurant/fragment/MenuTile.dart';
import 'package:Restaurant/fragment/SlidingPanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MenuPage extends StatefulWidget{
  int tableNumber;
  PanelController panelController = PanelController();

  //SlidingUpPanel slidingUpPanel = 

  
  MenuPage(this.tableNumber);

  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: menu.length, 
      child: Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
          bottom: TabBar(
            tabs: (){
              List<Tab> tabs = List<Tab>();
              for(int i=0; i<menu.length;i++){
                tabs.add(Tab(text: menu[i]['category'],));
              }
              return tabs;
            }(),
          ),
        ),
        body: SlidingUpPanel(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          controller: widget.panelController,
          backdropEnabled: true,
          collapsed:GestureDetector(
            onTap: () async {
              if(!widget.panelController.isPanelOpen)
                await widget.panelController.open();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  "Current Order",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ),
          ),
          panel: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child:SlidingPanel(widget.tableNumber),
            )
            // child: Padding(
            //   padding: EdgeInsets.only(top: 20,left: 10,bottom: 10,right: 10),
            //   child: SlidingPanel(tablesAmount),
            // ),
          ),
          body: TabBarView(
            children: (){
              List<ListView> listViews = List<ListView>();
              for(int i=0;i<menu.length;i++){
                listViews.add(ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                  ),
                  itemCount: menu[i]['items'].length,
                  itemBuilder: (BuildContext context, int index){
                    return MenuTile(
                      RestaurantMenuItem.fromJson(menu[i]['items'][index]),
                      widget.tableNumber
                    );
                  }
                ));
              }
              return listViews;
            }()
          ),
        )
      )
    );
  }
}