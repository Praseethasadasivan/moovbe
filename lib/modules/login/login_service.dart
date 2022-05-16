import 'package:moovbe/utils/apiConfig.dart';
import 'package:moovbe/utils/apiServce.dart';

class LoginService {
  Future<dynamic> loginApiRequest(dynamic payLoad) async {
    var data = await ApiService().post(
        url: 'http://flutter.noviindus.co.in/api/LoginApi', payload: payLoad);
    var accredit = AccessCredentials.fromJson(data);
    ApiConfig.accessCredentials = accredit;
    print("$data");
  }
}
