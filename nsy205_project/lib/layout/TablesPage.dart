import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Globals.dart';
import '../fragment/RestaurantTable.dart';

class TablesPage extends StatefulWidget{

  @override
  _TablesPageState createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage>{

  dynamic buildWithOrWithoutData(){
    return tableNumber==0
      ?FutureBuilder(
        future: Future.wait([manager.getTableNumber(context),manager.getMenuData(context)]),
        builder: (BuildContext context,
              AsyncSnapshot<List<dynamic>> snapshot) {
          List<Widget> children;
          if(snapshot.hasData){
            tableNumber=int.parse(snapshot.data[0]['tables'].toString());
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
                itemCount: tableNumber,
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
      )
        :Padding(
          padding: EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: (3/2.5),
            ),
            itemCount: tableNumber,
            itemBuilder: (BuildContext context, int index){
              return RestaurantTable(tableNumber: (index+1).toString(),);
            }
          ),
        );
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
      body: buildWithOrWithoutData(),
    );
  }

}