import 'dart:convert';

import 'RestaurantMenuItem.dart';


class RestaurantMenuItemOrder {
  int quantity;
  RestaurantMenuItem item;

  RestaurantMenuItemOrder(this.quantity,this.item);

  RestaurantMenuItemOrder.fromJson(Object jsonObject){
    dynamic jsonDeserialized = json.decode(jsonObject);
    quantity = jsonDeserialized['quantity'];
    item = RestaurantMenuItem.fromJson(jsonDeserialized['item']);
  }

  String toJson(){
    return json.encode({
      'quantity' : quantity,
      'item' : item.toJson(),
    });
  }

}