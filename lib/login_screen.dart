import 'package:bre_chat/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool _savingSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _savingSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 250.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kdecoration),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                    //Do something with the user input.
                  },
                  decoration: kdecoration.copyWith(hintText: 'Your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: RoundedButton(
                    onPressed: () async {
                      setState(() {
                        _savingSpinner = true;
                      });
                      //Implement registration functionality.
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        print(user);
                        if (user != null) {
                          Navigator.pushNamed(context, 'chatScreen');
                          setState(() {
                            _savingSpinner = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    text: 'Log in',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
