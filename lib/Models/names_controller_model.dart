class NamesControllerModel{
  String _childName = '';
  String _parentName = '';

  NamesControllerModel();


  void saveNamesAction() async{

  }

  void childNameChanged(String? val){
    if(val == null){return;}
    _childName = val;
  }

  void parentNameChanged(String? val){
    if(val == null){return;}
    _parentName = val;
  }

}