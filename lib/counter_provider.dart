import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier{

  ///data
  int _count = 0;
  List<Map<String, dynamic>> mData = [];

  ///listen observe watch
  int getValue() => _count;

  ///events
  void incrementCount(){
    /// data changed
    _count++;
    notifyListeners();
  }

  void decrementCount(){
    if(_count>0){
      _count--;
      notifyListeners();
    }


  }


}