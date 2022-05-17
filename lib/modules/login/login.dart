import 'package:flutter/material.dart';
import 'package:moovbe/modules/login/login_provider.dart';
import 'package:moovbe/modules/login/ui/login_ui.dart';
import 'package:moovbe/utils/apiconfig.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<ApiConfig, LoginProvider>(
      create: (context) => LoginProvider(),
      update: (context, apiconfig, loginprovider) {
        loginprovider?.onUpdate(apiconfig);
        return loginprovider!;
      },
      child: const LoginUI(),
    );
  }
}
