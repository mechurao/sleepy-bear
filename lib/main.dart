import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_context/one_context.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sleepy_bear/Controllers/login_controller.dart';
import 'firebase_options.dart';

import 'package:sleepy_bear/Controllers/main_controller.dart';
import 'package:sleepy_bear/UI/Themes/AppTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      theme: AppTheme.theme,
      home:  AuthController(),
    );
  }
}

