import 'dart:convert';

class RestaurantMenuItem{
  String _itemName;
  String _itemDescription;
  double _price;

  //constructor from json
  RestaurantMenuItem.fromJson(Object jsonObject){
    dynamic jsonDeserialized = json.decode(jsonObject);
    this._itemName = jsonDeserialized['name'];
    this._itemDescription = jsonDeserialized['description'];
    this._price = jsonDeserialized['price'];
  }

  //getters
  String get itemName => _itemName;

  String get itemDescription => _itemDescription;

  double get price => _price;

  //setters
  set setName(String name) => _itemName=name;

  set setDescription(String description) => _itemDescription=description;

  set setPrice(double price) => _price = price;

  //json string generator
  String toJson(){
    return json.encode({
      "name" : _itemName,
      "description" : _itemDescription,
      "price" : _price,
    });
  }

}