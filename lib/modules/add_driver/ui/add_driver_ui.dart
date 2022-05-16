import 'package:flutter/material.dart';

class AddDriverUI extends StatefulWidget {
  const AddDriverUI({Key? key}) : super(key: key);

  @override
  State<AddDriverUI> createState() => _AddDriverUIState();
}

class _AddDriverUIState extends State<AddDriverUI> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Driver"),
        backgroundColor: Colors.black,
      ),
      body: _buildBoody(_formKey),
    );
  }

  Widget _buildBoody(final _formKey) {
    return Form(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    labelText: 'Enter Name',
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
                        labelText: 'Enter License Numeber',
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
                  'Save',
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
    );
  }
}
