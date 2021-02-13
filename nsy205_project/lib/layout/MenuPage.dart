import 'package:Restaurant/Globals.dart';
import 'package:Restaurant/fragment/MenuTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuPage extends StatefulWidget{

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
        body: TabBarView(
          children: (){
            List<ListView> listViews = List<ListView>();
            for(int i=0;i<menu.length;i++){
              listViews.add(ListView.builder(
                itemCount: menu[i]['items'].length,
                itemBuilder: (BuildContext context, int index){
                  return MenuTile(
                    menu[i]['items'][index]['name'],
                    menu[i]['items'][index]['description'],
                    double.parse(menu[i]['items'][index]['price'])
                  );
                }
              ));
            }
            return listViews;
          }()
        ),
      )
    );
  }
}