import 'package:flutter/material.dart';
import 'package:flutter_app/screens/todo_screen.dart';
import 'package:flutter_app/utils/api_calls.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Scaffold(
              body: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/dummy_logo.png',
                  fit: BoxFit.fill,
                  width: 110,
                  height: 110,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid email address.';
                    }
                  },
                  decoration: InputDecoration(hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                  },
                  decoration: InputDecoration(hintText: "Enter your password"),
                ),
                SizedBox(
                  height: 50,
                ),
                loading
                    ? Image.asset(
                        'assets/icons/giphy.gif',
                        width: 48,
                        height: 48,
                      )
                    : FlatButton(
                        color: Colors.blue,
                        onPressed: () async {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();

                          setState(() {
                            loading = true;
                          });
                          String emal = email.text.toString();
                          String pass = password.text.toString();

                          bool flag = await login(email: emal, password: pass);
                          if (flag) {
                            print("");

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => TodoScreen()),
                                (route) => false);
                          } else {
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
