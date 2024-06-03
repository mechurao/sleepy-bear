import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectionService{
  static Future<bool> isConnectionActive() async{
    var connectivityResult = await Connectivity().checkConnectivity();
    return (!connectivityResult.contains(ConnectivityResult.none));
  }

}