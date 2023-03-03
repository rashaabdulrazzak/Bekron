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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 300.0,
            alignment: Alignment.center,
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
        ),
      ),
    );
  }
}
