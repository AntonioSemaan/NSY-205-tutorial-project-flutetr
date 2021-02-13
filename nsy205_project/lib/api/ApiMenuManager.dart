import 'dart:convert';

import 'package:flutter/cupertino.dart';

class ApiMenuManager{
  
  Future<dynamic> getTableNumber(BuildContext context) async {

    return (json.decode(await DefaultAssetBundle.of(context).loadString("assets/mock_data/mock-table-number.json")));
  }

  Future<dynamic> getMenuData(BuildContext context) async {
    
    return (json.decode(await DefaultAssetBundle.of(context).loadString("assets/mock_data/mock-menu-items.json")));
  }
}