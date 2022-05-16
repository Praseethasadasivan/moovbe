import 'package:flutter/cupertino.dart';
import 'package:moovbe/modules/home_screen/home_screeen_service.dart';

class HomeScreenProvider extends ChangeNotifier {
  Future retrieveBusList() async {
    var data = await HomeScreenService().downloadBusDeatilsRequest();
  }
}
