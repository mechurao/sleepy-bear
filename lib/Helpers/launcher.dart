import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sleepy_bear/Controllers/auth_controller.dart';
import 'package:sleepy_bear/Controllers/main_controller.dart';
import 'package:sleepy_bear/Controllers/names_controller.dart';
import 'package:sleepy_bear/Helpers/api_service.dart';
import 'package:sleepy_bear/Helpers/connection_service.dart';

abstract class Launcher{
  static Future<Widget> start() async{
    // check user login
    final user = FirebaseAuth.instance.currentUser;
    if(user == null){return const AuthController();}

    // check internet connection
    final conn = await ConnectionService.isConnectionActive();
    if(!conn){return const AuthController();}

    // check name setup
    final setup = await ApiService.namesSetUp();
    if(!setup){return  NamesController();}
    return MainController();
  }
}