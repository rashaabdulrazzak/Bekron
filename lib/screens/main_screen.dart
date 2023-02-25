import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flat_chat/components/rounded_button.dart';
import 'package:flat_chat/components/hero_logo.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: HeroLogo(imgHeight:160.0),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            RoundedButton(borderRadius: 8.0,textBtn: 'LOGIN',onPress: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(borderRadius: 8.0,textBtn: 'SIGN-UP',onPress: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),
          ],
        ),
      ),
    );
  }
}
