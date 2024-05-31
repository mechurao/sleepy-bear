import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class BottomSheet<T>{
  Future<T?> show(Widget controller) async{
    T? item = await showModalBottomSheet(
        context: OneContext().context!,
        builder: (BuildContext context){
          return controller;
        }
    );
    return item;
  }
}