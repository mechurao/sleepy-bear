import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

import '../../Values/screen_dimensions.dart';

class BottomSheet<T>{
  Future<T?> show(Widget controller,{Widget? attachment}) async{

    double _padding = ScreenDimensions.getScreenWidth() *  0.05;

    T? item = await showModalBottomSheet(
        context: OneContext().context!,
        builder: (BuildContext context){
          return Stack(
            clipBehavior: Clip.none,
            children: [
              if(attachment != null)attachment,
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _padding),
                  child: controller,
                ),
              )
            ],

          );
        }
    );
    return item;
  }
}