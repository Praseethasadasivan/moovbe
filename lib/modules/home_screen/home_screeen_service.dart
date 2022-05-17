import 'package:moovbe/modules/home_screen/model/buslist_model.dart';
import 'package:moovbe/utils/apiconfig.dart';
import 'package:moovbe/utils/apiServce.dart';

class HomeScreenService {
  Future<dynamic> downloadBusDeatilsRequest(
      AccessCredentials? _accessCred) async {
    Map<String, dynamic> headers = {
      "Authorization": "Bearer ${_accessCred?.accessTokem}"
    };
    print("Available userid${_accessCred?.accessTokem}");
    var data = await ApiService().get(
        url:
            'http://flutter.noviindus.co.in/api/BusListApi/${_accessCred?.userId ?? ""}',
        isAuthenticated: true,
        headers: headers);
    return BusDeatailsModel.fromJson(data);
  }
}
