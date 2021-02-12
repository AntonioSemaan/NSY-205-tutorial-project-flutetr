import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Globals.dart';
import '../entity/RestaurantMenuItem.dart';
import '../fragment/RestaurantTable.dart';

class TablesPage extends StatefulWidget{

  @override
  _TablesPageState createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage>{
  Future<Map<String,List<RestaurantMenuItem>>> getData() async{
    return await Future<Map<String,List<RestaurantMenuItem>>>.delayed(Duration(seconds: 2),(){
      return Map<String,List<RestaurantMenuItem>>();
    });
  }

  Future<int> getTables() async{
    return await Future<int>.delayed(Duration(seconds: 2),(){
      return 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "Tables"
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {

              },
              child: Icon(
                Icons.settings
              ),
            )
          )
        ],
      ),
      body: FutureBuilder(
        future: Future.wait([getTables(),getData()]),
        builder: (BuildContext context,
              AsyncSnapshot<List<dynamic>> snapshot) {
          List<Widget> children;
          if(snapshot.hasData){
            tableNumber=snapshot.data[0];
            menu = snapshot.data[1];
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: (3/2.5),
                ),
                itemCount: snapshot.data[0],
                itemBuilder: (BuildContext context, int index){
                  return RestaurantTable(tableNumber: (index+1).toString(),);
                }
              ),
            );
          }
          else if(snapshot.hasError){
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          }
          else{
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              children: children,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center
            ),
          );
        },
      ),
    );
  }

}