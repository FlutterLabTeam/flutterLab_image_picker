import 'package:flutter/material.dart';
import 'package:flutterlab_image_picker/tokens/screen_size.dart';

class ButtonAlertFrame extends StatelessWidget {
  final Color color;
  final String text;
  final TextStyle? textStyle;
  final Function() handledOpenImagePicker;

  const ButtonAlertFrame({
    Key? key,
    required this.text,
    required this.color,
    required this.textStyle,
    required this.handledOpenImagePicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSize.height(context) * 0.03,
      ),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: color,
        child: InkWell(
          onTap: () => handledOpenImagePicker(),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: ScreenSize.height(context) * 0.025,
            ),
            alignment: Alignment.center,
            child: Text(text, style: textStyle),
          ),
        ),
      ),
    );
  }
}
