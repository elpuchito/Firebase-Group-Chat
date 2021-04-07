import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'welcome_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BckdCircles(),
          ModalProgressHUD(
            inAsyncCall: _saving,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 200.0,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
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
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kdecoration.copyWith(hintText: 'Password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      decoration: kBlackBtonDecoration,
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 30.0),
                        onPressed: () async {
                          setState(() {
                            _saving = true;
                          });
                          //Implement registration functionality.
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            print(newUser);
                            if (newUser != null) {
                              Navigator.pushNamed(context, 'chatScreen');
                              setState(() {
                                _saving = false;
                              });
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Text('Or',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  RoundedButtonNoFill(
                    text: 'Continue wih Google',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BckdCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: FractionalTranslation(
        translation: Offset(0.5, 0.5),
        child: Transform.scale(
          scale: 5,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Container(
              margin: EdgeInsets.all(80.0),
              decoration: BoxDecoration(
                  color: Colors.grey[200], shape: BoxShape.circle),
              // height: 400,
              child: Container(
                // height: 200,
                // width: 200,
                margin: EdgeInsets.all(80.0),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
