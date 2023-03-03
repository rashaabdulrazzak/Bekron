import 'package:flutter/material.dart';

const mainAppColor = Color(0xFF660935);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
) ;

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your value',
  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.black),
  filled: true,
  fillColor: Color(0xFFEEEFEF),
  contentPadding:
  EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
  isDense: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFEEEFEF), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFEEEFEF), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(7.0)),
  ),
);


