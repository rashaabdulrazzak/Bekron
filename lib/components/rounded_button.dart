import 'package:flutter/material.dart';
import 'package:flat_chat/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.borderRadius,required this.textBtn, required this.onPress});

  final double borderRadius ;
  final VoidCallback onPress ;
  final String textBtn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: Material(
        elevation: 5.0,
        color: mainAppColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 160.0,
          height: 39.0,
          child: Text(
            textBtn,
            style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}