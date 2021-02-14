
import 'package:Restaurant/api/ApiMenuManager.dart';
import 'package:Restaurant/entity/DataChangeNotifier.dart';
import 'entity/RestaurantMenuItemOrder.dart';

ApiMenuManager manager = ApiMenuManager();
Map<int,Map<int,RestaurantMenuItemOrder>> tablesData = Map<int,Map<int,RestaurantMenuItemOrder>>();
List<dynamic> menu = List<dynamic>();
int tablesAmount=0;
DataChangeNotifier menuDataChanged = new DataChangeNotifier();