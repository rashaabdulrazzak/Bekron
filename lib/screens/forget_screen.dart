//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flat_chat/constants.dart';
import 'package:flat_chat/components/rounded_button.dart';
import 'package:flat_chat/components/hero_logo.dart';
import 'package:flat_chat/components/start_pages_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPassword extends StatefulWidget {
  static String id = 'forgot_screen';
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late String emailorphone ;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall:showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: HeroLogo(imgHeight:100.0),
              ),
              StartPagesHeader(mainText:'FORGOT YOUR PASSWORD?'),
              TextFormField(
                onChanged: (value) {emailorphone=value;},
                decoration:  kTextFieldDecoration.copyWith(hintText: 'Email or Phone Number'),
                //keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 13.0),
              RoundedButton(borderRadius: 15.0,textBtn: 'SEND RESET LINK',onPress: () async{},),
            ],
          ),
        ),
      ),
    );
  }
}
