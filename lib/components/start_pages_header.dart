import 'package:flutter/material.dart';

class StartPagesHeader extends StatelessWidget {
  StartPagesHeader({required this.mainText});
  final String mainText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0.0,40.0,0.0,15.0),
      child: Text(
        '$mainText',
        style:TextStyle(
          fontSize: 15.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
