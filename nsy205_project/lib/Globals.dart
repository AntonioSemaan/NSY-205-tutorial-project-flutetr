
import 'package:Restaurant/api/ApiMenuManager.dart';
import 'entity/RestaurantMenuItemOrder.dart';

ApiMenuManager manager = ApiMenuManager();
Map<int,List<RestaurantMenuItemOrder>> tablesData = Map<int,List<RestaurantMenuItemOrder>>();
List<dynamic> menu = List<dynamic>();
int tableNumber=0;