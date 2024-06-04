import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sleepy_bear/Controllers/main_controller.dart';
import 'package:sleepy_bear/Controllers/names_controller.dart';

import '../Controllers/auth_controller.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    if(kDebugMode){
      return NamesController();
    }

    final user = FirebaseAuth.instance.currentUser;
    if(user != null){return MainController();}
    return const AuthController();
  }
}