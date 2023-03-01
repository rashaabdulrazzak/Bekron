import 'package:flutter/material.dart';
import 'package:flat_chat/constants.dart';
import 'dart:math';

class LaunchScreen extends StatefulWidget {
  static String id = 'launch_screen';

  const LaunchScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int launchImageIndex = random.nextInt(3);

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/launch-img-$launchImageIndex.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
