import 'package:moovbe/utils/apiConfig.dart';
import 'package:moovbe/utils/apiServce.dart';

class HomeScreenService {
  Future<dynamic> downloadBusDeatilsRequest() async {
    var data = await ApiService().get(
        url:
            'http://flutter.noviindus.co.in/api/BusListApi/${ApiConfig.accessCredentials?.accessTokem ?? ""}');
    print(data);
  }
}
