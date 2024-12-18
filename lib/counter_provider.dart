import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier{

  ///data
  int _count = 0;

  ///listen observe watch
  int getValue() => _count;

  ///events
  void incrementCount(){
    /// data changed
    _count++;
    notifyListeners();
  }


}