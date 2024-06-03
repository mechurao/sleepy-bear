import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

import '../../Values/screen_dimensions.dart';

abstract class ModalSheet {
  static Future<bool?> show(
      Widget controller,
      {Widget? attachment,
        bool? handler,
        double? height
      }) async {

    final showHandler = (handler != null && !handler) ? false : true;
    bool? item = await showModalBottomSheet(
      context: OneContext().context!,
      isScrollControlled: true,
      showDragHandle: showHandler,
      builder: (BuildContext context) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            if (attachment != null) attachment,
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: ScreenDimensions.getScreenWidth() * 0.9,
                  height: height,
                  child: IntrinsicHeight(
                    child: controller,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    return item;
  }
}
