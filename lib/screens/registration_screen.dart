import 'package:flutter/material.dart';
import 'package:flat_chat/constants.dart';
import 'package:flat_chat/components/rounded_button.dart';
import 'package:flat_chat/components/hero_logo.dart';
import 'package:flat_chat/components/start_pages_header.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:flat_chat/screens/login_screen.dart';
import 'package:flat_chat/screens/agreement.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'register_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String phone;
  late String password;
  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(child: HeroLogo(imgHeight:100.0),),
              StartPagesHeader(mainText:'CREATE YOUR ACCOUNT'),
              TextFormField(
                onChanged: (value) {email=value;},
                decoration:  kTextFieldDecoration.copyWith(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10.0,),
              TextFormField(
                onChanged: (value) {phone=value;},
                decoration:  kTextFieldDecoration.copyWith(hintText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10.0,),
              TextFormField(
                onChanged: (value) {password = value;},
                obscureText: true,
                decoration:  kTextFieldDecoration.copyWith(hintText: 'Password'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                onChanged: (value) {confirmPassword = value;},
                obscureText: true,
                decoration:  kTextFieldDecoration.copyWith(hintText: 'Password Confirm'),
              ),
              SizedBox(height: 10.0),
              RoundedButton(borderRadius: 15.0,textBtn: 'SIGN UP',onPress: () async {
                if(email!=null&&phone!=null&&password!=null){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return AgreementScreen(email:email,phone: phone, password: password,);
                  }));
                }
              },),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, LoginScreen.id);},
                child: Text(
                  'You have an account?',
                  style:TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}