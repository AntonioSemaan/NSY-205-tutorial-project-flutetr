import 'package:flutter/cupertino.dart';

class DataChangeNotifier extends ChangeNotifier{
  

  void trigger(){
    notifyListeners();
  }
}