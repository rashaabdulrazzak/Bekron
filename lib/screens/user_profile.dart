import 'package:flutter/material.dart';
import 'package:flat_chat/components/hero_logo.dart';

import '../components/rounded_button.dart';
import '../constants.dart';

class UserProfile extends StatefulWidget {
  static String id = 'user_profile_screen';
  const UserProfile({Key? key}) : super(key: key);


  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,

        children: [
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
             child: Image.asset('images/bekron.png'),
            ),
          ),
          const Text('Hi,Ahmad',style:TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          )),
          Expanded(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextRow(title: "Reward drink",titleResult:'3', imagePath: 'images/paper-cup.png',),
                  TextRow(title: "Star balance",titleResult:'4', imagePath: 'images/star.png',),
                ],
              ),
            ),
          ),
          // cup component
          Center(
            child: RoundedButton(borderRadius: 10.0,textBtn: 'SCAN QR',onPress: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context){
                //   return UserScan();
                 // }));
            },),
          ),
          TextRow(title: "Whirl", titleResult: '0', imagePath: 'images/paper-cup.png'),
          // Whirl component
        ],
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String title;
  final String titleResult;
 final String imagePath;
   const TextRow({
    required this.title,
    required this.titleResult,
  required this.imagePath
});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Text(title, style:kUserProfileText,
          ),
          SizedBox(width: 6,),
          Text(titleResult,style:kUserProfileText),
          SizedBox(width: 6,),
          Image.asset(imagePath,width: 20,height: 20, ),

        ],
      ),
    );
  }
}
