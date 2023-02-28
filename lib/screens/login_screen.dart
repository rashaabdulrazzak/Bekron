//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flat_chat/constants.dart';
import 'package:flat_chat/components/rounded_button.dart';
import 'package:flat_chat/components/hero_logo.dart';
import 'package:flat_chat/components/start_pages_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:flat_chat/screens/forget_screen.dart';
import 'package:flat_chat/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _auth = FirebaseAuth.instance ;
  late String emailorphone ;
  late String password;
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
              StartPagesHeader(mainText:'LOGIN INTO YOUR ACCOUNT'),
              TextFormField(
                onChanged: (value) {emailorphone=value;},
                decoration:  kTextFieldDecoration.copyWith(hintText: 'Email or Phone Number'),
                //keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10.0,),
              TextFormField(
                onChanged: (value) {password = value;},
                obscureText: true,
                decoration:  kTextFieldDecoration.copyWith(hintText: 'Password'),
              ),
              SizedBox(height: 13.0),
              RoundedButton(borderRadius: 15.0,textBtn: 'LogIn',onPress: () async{
                //Implement login functionality.
                /*setState(() {showSpinner = true;});
                try{
                  final isLoggedinUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(isLoggedinUser != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {showSpinner = false;});
                }catch(e){print(e);}*/
              },),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, ForgotPassword.id);},
                child: Text(
                  'Forgot Password?',
                  style:TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                ),
              ),
              SizedBox(height: 7.0),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, RegistrationScreen.id);},
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Don\'t have an account? '),
                      TextSpan(text: 'SIGN UP', style: TextStyle(color: mainAppColor)),
                    ],
                    style:TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}