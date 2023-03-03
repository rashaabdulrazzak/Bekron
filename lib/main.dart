//import 'package:firebase_core/firebase_core.dart';
import 'package:flat_chat/screens/admin_control_panel.dart';
import 'package:flat_chat/screens/user_profile.dart';
import 'package:flat_chat/screens/user_scan.dart';
import 'package:flutter/material.dart';
import 'package:flat_chat/screens/welcome_screen.dart';
import 'package:flat_chat/screens/login_screen.dart';
import 'package:flat_chat/screens/registration_screen.dart';
import 'package:flat_chat/screens/chat_screen.dart';
import 'package:flat_chat/screens/main_screen.dart';
import 'package:flat_chat/screens/forget_screen.dart';
import 'package:flat_chat/screens/launch_screen.dart';
import 'package:flat_chat/screens/admin_scan_qr.dart';
import 'package:flat_chat/constants.dart';

import 'components/whirl_count.dart';
import 'package:flat_chat/screens/talk_to_us.dart';

void main() async {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bekron App',
      home: const LaunchScreen(),
      theme: ThemeData(
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: mainAppColor),
      ),
      routes: {
        MainScreen.id: (context) => MainScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ForgotPassword.id: (context) => ForgotPassword(),
        UserProfile.id: (context) => const UserProfile(),
        UserScan.id: (context) => UserScan(),
        WhirlCount.id: (context) => WhirlCount(),
        AdminControlPanel.id: (context) => AdminControlPanel(),
        LaunchScreen.id: (context) => const LaunchScreen(),
        TalkToUs.id: (context) => TalkToUs(),
        AdminScanQr.id: (context) => AdminScanQr(),
      },
    );
  }
}
