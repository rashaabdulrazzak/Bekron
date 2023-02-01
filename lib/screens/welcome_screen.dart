import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flat_chat/components/rounded_button.dart';
class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      // speed: const Duration(milliseconds: 2000),
                    ),
                  ],


                ),

              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(colorBtn: Colors.lightBlueAccent,textBtn: 'Log In',onPress: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(colorBtn: Colors.blueAccent,textBtn: 'Register',onPress: (){
              // first sol
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>  RegistrationScreen()));
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),

          ],
        ),
      ),
    );
  }
}


// child: Material(
// elevation: 5.0,
// color: Colors.lightBlueAccent,
// borderRadius: BorderRadius.circular(30.0),
// child: MaterialButton(
// onPressed: () {
// //Go to login screen.
// //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
// Navigator.pushNamed(context, LoginScreen.id);
// },
// minWidth: 200.0,
// height: 42.0,
// child: Text(
// 'Log In',
// ),
