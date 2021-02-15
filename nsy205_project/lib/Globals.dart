
import 'dart:io';

import 'package:Restaurant/entity/DataChangeNotifier.dart';
import 'package:Restaurant/managers/MainApiRepo.dart';
import 'package:Restaurant/managers/api/ApiMenuManager.dart';
import 'package:http/io_client.dart';
import 'entity/RestaurantMenuItemOrder.dart';

MainApiRepo apiRepo = MainApiRepo();
Map<int,Map<int,RestaurantMenuItemOrder>> tablesData = Map<int,Map<int,RestaurantMenuItemOrder>>();
List<dynamic> menu = List<dynamic>();
int tablesAmount=0;
DataChangeNotifier menuDataChanged = new DataChangeNotifier();

HttpClient httpClient = HttpClient();
IOClient ioClient = IOClient(httpClient);