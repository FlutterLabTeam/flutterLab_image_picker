import 'package:flutter/material.dart';
import 'package:flutterlab_image_picker/tokens/app_color.dart';
import 'package:flutterlab_image_picker/model/alert_model.dart';
import 'package:flutterlab_image_picker/tokens/screen_size.dart';
import 'package:flutterlab_image_picker/atoms/button_alert_frame.dart';

class BodyAlert extends StatelessWidget {
  final AlertModel alertModel;
  final Function(bool) handledOpenImagePicker;

  const BodyAlert({
    Key? key,
    required this.alertModel,
    required this.handledOpenImagePicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        alertModel.activeButtonClose
            ? Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width(context) * 0.03),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: AppColor.black,
                  ),
                ),
              )
            : Container(),
        alertModel.title,
        alertModel.description,
        Row(
          children: [
            Expanded(
              child: ButtonAlertFrame(
                text: "Photo",
                color: alertModel.colorButton,
                textStyle: alertModel.textStyle,
                  handledOpenImagePicker:()=> handledOpenImagePicker(true)
              ),
            ),
            Expanded(
              child: ButtonAlertFrame(
                text: "Gallery",
                color: alertModel.colorButton,
                textStyle: alertModel.textStyle,
                  handledOpenImagePicker:()=> handledOpenImagePicker(false)
              ),
            ),
          ],
        )
      ],
    );
  }
}
