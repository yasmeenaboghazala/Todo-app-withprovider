import 'package:credit/homepage.dart';
import 'package:flutter/material.dart';

class cert extends ChangeNotifier {
  final List<item> _items = [];
  double price = 0.0;
  void add(item item) {
    _items.add(item);
    price += item.price;
    notifyListeners();
  }

  void remove(item item) {
    _items.remove(item);
    price -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalprice {
    return price;
  }

  List<item> get baskitem {
    return _items;
  }
}
