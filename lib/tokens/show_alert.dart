import 'package:flutter/material.dart';
import 'package:flutterlab_image_picker/model/alert_model.dart';
import 'package:flutterlab_image_picker/tokens/screen_size.dart';

showAlert({
  required Widget body,
  required BuildContext context,
  required AlertModel alertModel,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: alertModel.width,
            height: alertModel.height,
            decoration: BoxDecoration(
              color: alertModel.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenSize.height(context) * 0.03,
              ),
              child: body,
            ),
          ),
        ),
      );
    },
  );
}
