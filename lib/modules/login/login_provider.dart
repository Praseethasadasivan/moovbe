import 'package:flutter/cupertino.dart';
import 'package:moovbe/modules/login/login_service.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future loginRequest() async {
    dynamic header = {
      "username": usernameController.text,
      "password": passwordController.text
    };
    try {
      var response = await LoginService().loginApiRequest(header);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
