import 'package:flutter/material.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(_formKey),
    );
  }

  Widget _buildBody(final _formKey) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 266,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 127, right: 156, left: 30),
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
        ),
        Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(left: 29, right: 25, top: 40),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(42, 42, 42, 0.1),
                    borderRadius: new BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
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
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter password',
                          )))),
            ),
            SizedBox(
              height: 200,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 35, right: 19),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Color.fromRGBO(252, 21, 59, 1),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Color.fromRGBO(252, 21, 59, 1),
                        )),
                  ),
                )),
          ]),
        ),
      ],
    );
  }
}
