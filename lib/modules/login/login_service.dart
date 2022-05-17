import 'package:moovbe/utils/apiconfig.dart';
import 'package:moovbe/utils/apiServce.dart';

class LoginService {
  Future<AccessCredentials> loginApiRequest(dynamic payLoad) async {
    var data = await ApiService().post(
        url: 'http://flutter.noviindus.co.in/api/LoginApi', payload: payLoad);
    var accredit = AccessCredentials.fromJson(data);
    return accredit;
  }
}
