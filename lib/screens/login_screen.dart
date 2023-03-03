//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flat_chat/constants.dart';
import 'package:flat_chat/components/rounded_button.dart';
import 'package:flat_chat/components/hero_logo.dart';
import 'package:flat_chat/components/start_pages_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flat_chat/screens/forget_screen.dart';
import 'package:flat_chat/screens/registration_screen.dart';
import 'package:regexed_validator/regexed_validator.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _auth = FirebaseAuth.instance ;
  late String emailorphone ;
  late String password;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();

  String? validateInputs(String? value, String inputType) {
    if(value==null||value.isEmpty ) {return "* Required";}
    else if(inputType=='mailphone' && !validator.email(value) && !validator.phone(value)){
      return 'Please enter a valid email or phone';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall:showSpinner,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(child: HeroLogo(imgHeight:100.0),),
                StartPagesHeader(mainText:'LOGIN INTO YOUR ACCOUNT'),
                TextFormField(
                  onChanged: (value) {emailorphone=value;},
                  decoration:  kTextFieldDecoration.copyWith(hintText: 'Email or Phone Number'),
                  validator: (value) =>validateInputs(value, 'mailphone'),
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  onChanged: (value) {password = value;},
                  obscureText: true,
                  decoration:  kTextFieldDecoration.copyWith(hintText: 'Password'),
                  validator: (value) =>validateInputs(value, 'password'),
                ),
                SizedBox(height: 13.0),
                RoundedButton(borderRadius: 15.0,textBtn: 'LogIn',onPress: () async{
                  if (_formKey.currentState!.validate()) {
                    //Implement login functionality.
                    /*setState(() {showSpinner = true;});
                    try{
                      final isLoggedinUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(isLoggedinUser != null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {showSpinner = false;});
                    }catch(e){print(e);}*/
                  }
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
      ),
    );
  }
}