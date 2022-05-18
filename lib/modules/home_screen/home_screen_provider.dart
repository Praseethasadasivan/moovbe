import 'package:flutter/cupertino.dart';
import 'package:moovbe/modules/home_screen/home_screeen_service.dart';
import 'package:moovbe/modules/home_screen/model/buslist_model.dart';
import 'package:moovbe/utils/apiconfig.dart';

class HomeScreenProvider extends ChangeNotifier {
  ApiConfig? _apiConfig;
  BusDeatailsModel? busDeatails;
  bool isLoading = true;
  onUpdate(ApiConfig apiConfig) {
    _apiConfig = apiConfig;
    print("onupdate ${apiConfig.accessCredentials?.accessTokem}");
  }

  onCreate(ApiConfig apiConfig) {
    _apiConfig = apiConfig;
  }

  Future retrieveBusList() async {
    setLoading(true);
    Future.delayed(const Duration(seconds: 5), () async {
      busDeatails = await HomeScreenService()
          .downloadBusDeatilsRequest(_apiConfig?.accessCredentials);
      notifyListeners();
      setLoading(false);
    });
  }

  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }
}
