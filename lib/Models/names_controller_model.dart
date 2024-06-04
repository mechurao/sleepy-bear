import 'package:sleepy_bear/Helpers/alert_service.dart';
import 'package:sleepy_bear/Helpers/api_service.dart';
import 'package:sleepy_bear/Helpers/connection_service.dart';
import 'package:sleepy_bear/Helpers/hud_helper.dart';
import 'package:sleepy_bear/Helpers/navigation_helper.dart';
import 'package:sleepy_bear/Values/strings.dart';

class NamesControllerModel{
  String _childName = '';
  String _parentName = '';

  NamesControllerModel();


  void saveNamesAction() async{
    final conn = await ConnectionService.isConnectionActive();
    if(!conn){
      await AlertService.showConnectionAlert();
      return;
    }
    final check = _inputValid();
    if(!check){
      await AlertService.showAlert(Strings.inputsEmptyTitle, message: Strings.inputsEmptyMsg);
    }

    HudHelper.showHud();
    final save = await ApiService.saveNames(_parentName, _childName);
    HudHelper.dismissHud();
    if(!save){
      await AlertService.showErrorAlert();
      return;
    }
    NavigationHelper.openApp();

  }

  void childNameChanged(String? val){
    if(val == null){return;}
    _childName = val;
  }

  void parentNameChanged(String? val){
    if(val == null){return;}
    _parentName = val;
  }


  bool _inputValid(){
    return _childName.isNotEmpty && _parentName.isNotEmpty;
  }


}