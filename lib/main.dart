import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_context/one_context.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sleepy_bear/Controllers/auth_controller.dart';
import 'package:sleepy_bear/Controllers/names_controller.dart';
import 'package:sleepy_bear/Helpers/launcher.dart';
import 'firebase_options.dart';

import 'package:sleepy_bear/Controllers/main_controller.dart';
import 'package:sleepy_bear/UI/Themes/AppTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // setup offline database
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED
  );

  // get start screen
  final start = await Launcher.start();

  runApp( MyApp(startScreen: start,));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  const MyApp({
    super.key,
    required this.startScreen
  });


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
      home:  MainController(),
    );
  }
}

