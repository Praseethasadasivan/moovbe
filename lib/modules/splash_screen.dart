import 'package:flutter/material.dart';
import 'package:moovbe/modules/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 21, 59, 1),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Image.asset('assets/images/logo.png'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(316, 58),
                primary: Colors.white, // background
                onPrimary: Color.fromRGBO(252, 21, 59, 1), // foreground
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Login())),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
