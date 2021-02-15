import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left:10,right:10),
        child: ListView(
          children: [
            InkWell(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Edit Categories",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Divider(color: Colors.black,),
            InkWell(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Edit Items",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}