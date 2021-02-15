import 'dart:convert';

import 'package:Restaurant/managers/ApiManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ApiMenuManager{
  
  ApiManager apiManager = ApiManager();

  Future<dynamic> getTableNumberMock(BuildContext context) async {

    return (json.decode(await DefaultAssetBundle.of(context).loadString("assets/mock_data/mock-table-number.json")));
  }

  Future<dynamic> getMenuDataMock(BuildContext context) async {
    
    return (json.decode(await DefaultAssetBundle.of(context).loadString("assets/mock_data/mock-menu-items.json")));
  }

  Future<dynamic> getTableNumber() async {

    Response response = await apiManager.get("getTables");
    return json.decode(response.body.toString());
  }

  Future<dynamic> getMenuData() async {
    
    Response response = await apiManager.get("getMenu");
    return json.decode(response.body.toString());
  }
}