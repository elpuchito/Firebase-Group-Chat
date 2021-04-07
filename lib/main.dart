import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'package:bre_chat/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          WelcomeScreen.id: (context) => WelcomeScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          'LoginScreen': (context) => LoginScreen(),
          'RegistrationScreen': (context) => RegistrationScreen(),
          'chatScreen': (context) => ChatScreen(),
        });
  }
}
