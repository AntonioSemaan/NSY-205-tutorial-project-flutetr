import 'dart:convert';

class RestaurantMenuItem{
  int _id;
  String _itemName;
  String _itemDescription;
  double _price;

  //constructor from json
  RestaurantMenuItem.fromJson(Object jsonObject){
    dynamic jsonDeserialized = jsonObject is String?json.decode(jsonObject):jsonObject;
    this._id = int.parse(jsonDeserialized['id']);
    this._itemName = jsonDeserialized['name'];
    this._itemDescription = jsonDeserialized['description'];
    this._price = double.parse(jsonDeserialized['price']);
  }

  //getters
  int get id => _id;

  String get itemName => _itemName;

  String get itemDescription => _itemDescription;

  double get price => _price;

  //setters
  set setId(int id) => _id=id;

  set setName(String name) => _itemName=name;

  set setDescription(String description) => _itemDescription=description;

  set setPrice(double price) => _price = price;

  //json string generator
  String toJson(){
    return json.encode({
      "id": _id.toString(),
      "name" : _itemName,
      "description" : _itemDescription,
      "price" : _price.toString(),
    });
  }

}