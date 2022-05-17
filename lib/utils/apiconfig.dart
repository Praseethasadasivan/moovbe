import 'package:flutter/cupertino.dart';

class ApiConfig with ChangeNotifier {
  AccessCredentials? accessCredentials;
  setAccessCredentials(AccessCredentials _accessCredential) {
    accessCredentials = _accessCredential;
    notifyListeners();
  }
}

class AccessCredentials {
  final bool? status;
  final String? name;
  final dynamic refreshToken;
  final dynamic accessTokem;
  final dynamic userId;
  AccessCredentials(
      {this.name,
      this.status,
      this.accessTokem,
      this.refreshToken,
      this.userId});
  AccessCredentials.fromJson(Map payLoad)
      : status = payLoad["status"],
        name = payLoad["name"],
        accessTokem = payLoad["access"],
        refreshToken = payLoad["refresh"],
        userId = payLoad["url_id"];
}
