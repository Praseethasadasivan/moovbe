import 'package:flutter/cupertino.dart';
import 'package:moovbe/modules/home_screen/model/buslist_model.dart';

class BusProvider extends ChangeNotifier {
  BusList? bus;
  int seatCount = 0;
  setSeatCount(int _seatCount) {
    seatCount = _seatCount;
    notifyListeners();
  }
}
