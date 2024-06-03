import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Controllers/auth_controller.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint("User not signed up");
    } else {
      debugPrint("User signed in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const AuthController();
  }
}