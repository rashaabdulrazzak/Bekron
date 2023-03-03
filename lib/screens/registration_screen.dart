import 'package:flutter/material.dart';
import 'package:flat_chat/constants.dart';
import 'package:flat_chat/components/rounded_button.dart';
import 'package:flat_chat/components/hero_logo.dart';
import 'package:flat_chat/components/start_pages_header.dart';
import 'package:flat_chat/screens/login_screen.dart';
import 'package:flat_chat/screens/agreement.dart';
import 'package:regexed_validator/regexed_validator.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'register_screen';
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String name;
  late String email;
  late String phone;
  late String password;
  late String confirmPassword;

  final _formKey = GlobalKey<FormState>();

  String? validateInputs(String? value, String inputType) {
    if(value==null||value.isEmpty ) {return "* Required";}
    else if(inputType=='email' && !validator.email(value) ){
      return 'Please enter a valid email';
    }
    else if(inputType=='phone' && !validator.phone(value)){
      return 'Please enter a valid phone';
    }
    else if(inputType=='confirmPassword' && password!=confirmPassword){
      return "Passwords don't match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(child: HeroLogo(imgHeight:100.0),),
                StartPagesHeader(mainText:'CREATE YOUR ACCOUNT'),
                TextFormField(
                  onChanged: (value) {name=value;},
                  decoration:  kTextFieldDecoration.copyWith(hintText: 'Name'),
                  validator: (value) =>validateInputs(value, 'name'),
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  onChanged: (value) {email=value;},
                  decoration:  kTextFieldDecoration.copyWith(hintText: 'Email'),
                  validator: (value) =>validateInputs(value, 'email'),
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  onChanged: (value) {phone=value;},
                  decoration:  kTextFieldDecoration.copyWith(hintText: 'Phone Number'),
                  validator: (value) =>validateInputs(value, 'phone'),
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  onChanged: (value) {password = value;},
                  obscureText: true,
                  decoration:  kTextFieldDecoration.copyWith(hintText: 'Password'),
                  validator: (value) =>validateInputs(value, 'password'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  onChanged: (value) {confirmPassword = value;},
                  obscureText: true,
                  decoration:  kTextFieldDecoration.copyWith(hintText: 'Password Confirm'),
                  validator: (value) =>validateInputs(value, 'confirmPassword'),
                ),
                SizedBox(height: 10.0),
                RoundedButton(borderRadius: 15.0,textBtn: 'SIGN UP',onPress: () async {
                  if(_formKey.currentState!.validate()){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return AgreementScreen(name:name,email:email,phone: phone, password: password,);
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
      ),
    );
  }
}