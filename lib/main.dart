//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flat_chat/screens/welcome_screen.dart';
import 'package:flat_chat/screens/login_screen.dart';
import 'package:flat_chat/screens/registration_screen.dart';
import 'package:flat_chat/screens/chat_screen.dart';
import 'package:flat_chat/screens/main_screen.dart';
import 'package:flat_chat/screens/forget_screen.dart';
import 'package:flat_chat/constants.dart';

void main() async  {
 //WidgetsFlutterBinding.ensureInitialized();

// await Firebase.initializeApp();
runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id ,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: mainAppColor
        ),
      ),
      routes: {
        MainScreen.id: (context) => MainScreen(),
        WelcomeScreen.id : (context) =>  WelcomeScreen(),
        LoginScreen.id: (context) =>  LoginScreen(),
        RegistrationScreen.id: (context) =>  RegistrationScreen(),
        ForgotPassword.id: (context) =>  ForgotPassword(),
        ChatScreen.id: (context) =>  ChatScreen(),
      },
    );
  }
}
