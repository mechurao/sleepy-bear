import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_context/one_context.dart';

import 'package:sleepy_bear/Controllers/loading_controller.dart';
import 'package:sleepy_bear/Controllers/login_controller.dart';
import 'package:sleepy_bear/Controllers/main_controller.dart';
import 'package:sleepy_bear/UI/Themes/AppTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home:  MainController(),
    );
  }
}

