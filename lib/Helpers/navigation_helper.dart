import 'package:one_context/one_context.dart';
import 'package:sleepy_bear/Controllers/auth_controller.dart';
import 'package:sleepy_bear/Controllers/main_controller.dart';
import 'package:sleepy_bear/UI/Routes/MainRoute.dart';

abstract class NavigationHelper{
  static void openApp(){
    OneContext().pushReplacement(MainRoute(builder: (context) => MainController()));
  }

  static void openAuth(){
    OneContext().pushReplacement(MainRoute(builder: (context) => const AuthController()));
  }

  static void openNameSetup(){
    //TODO
  }
}