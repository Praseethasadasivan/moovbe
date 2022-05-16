import 'package:flutter/material.dart';
import 'package:moovbe/modules/home_screen/home_screen.dart';
import 'package:moovbe/modules/login/login_provider.dart';
import 'package:provider/provider.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    LoginProvider provider = context.watch<LoginProvider>();
    return SafeArea(
      child: Scaffold(
        body: _buildBody(_formKey, provider),
      ),
    );
  }

  Widget _buildBody(final _formKey, LoginProvider provider) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 375,
                height: 266,
                decoration: BoxDecoration(color: Colors.black),
              ),
              Image.asset("assets/images/Polygon.png"),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 127, right: 156, left: 30),
                    child: Text(
                      "Welcome",
                      style: TextStyle(fontSize: 41, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 116, left: 30),
                    child: Text(
                      "Manage your Bus and Drivers",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 29, right: 25, top: 40),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(42, 42, 42, 0.1),
                          borderRadius: new BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: provider.usernameController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter Username',
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29, right: 25),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(42, 42, 42, 0.1),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                controller: provider.passwordController,
                                textAlign: TextAlign.center,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Enter password',
                                )))),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 35, right: 19, bottom: 15),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Color.fromRGBO(252, 21, 59, 1),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState!.validate()) {
                              provider.loginRequest();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color.fromRGBO(252, 21, 59, 1),
                              )),
                        ),
                      )),
                ]),
          ),
        ],
      ),
    );
  }
}
