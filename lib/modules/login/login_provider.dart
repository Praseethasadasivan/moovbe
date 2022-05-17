import 'package:flutter/cupertino.dart';
import 'package:moovbe/modules/login/login_service.dart';
import 'package:moovbe/utils/apiconfig.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ApiConfig _apiConfig;
  onUpdate(ApiConfig apiConfig) {
    _apiConfig = apiConfig;
  }

  Future loginRequest() async {
    dynamic header = {
      "username": usernameController.text,
      "password": passwordController.text
    };
    try {
      AccessCredentials response = await LoginService().loginApiRequest(header);
      _apiConfig.setAccessCredentials(response);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
