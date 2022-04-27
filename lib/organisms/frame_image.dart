import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterlab_image_picker/atoms/button_frame.dart';
import 'package:flutterlab_image_picker/model/alert_model.dart';
import 'package:flutterlab_image_picker/molecules/body_alert.dart';
import 'package:flutterlab_image_picker/molecules/container_image_frame.dart';
import 'package:flutterlab_image_picker/tokens/app_color.dart';
import 'package:flutterlab_image_picker/tokens/show_alert.dart';
import 'package:image_picker/image_picker.dart';

enum TypeFigureFrameImage {
  square,
  circle,
  noneFigureFrame,
}

enum ImageProviderFrame {
  file,
  assets,
  network,
}

class FrameImage extends StatelessWidget {
  final Icon? icon;
  final Color color;
  final double size;
  final String image;
  final Widget? body;
  final Function()? onTap;
  final AlertModel? alertModel;
  final Function(String) callBackPath;
  final ImageProviderFrame imageProvider;
  final TypeFigureFrameImage typeFigureFrameImage;

  const FrameImage(
    this.image, {
    Key? key,
    this.icon,
    this.body,
    this.onTap,
    this.size = 100,
    this.alertModel,
    required this.callBackPath,
    this.color = AppColor.orange,
    this.imageProvider = ImageProviderFrame.network,
    this.typeFigureFrameImage = TypeFigureFrameImage.circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ContainerImageFrame(
          image,
          size: size,
          body: body,
          color: color,
          imageProvider: imageProvider,
          typeFigureFrameImage: typeFigureFrameImage,
        ),
        ButtonFrame(
          size: size / 4,
          icon: icon,
          color: color,
          handledButton: () {
            if (onTap != null) {
              onTap!();
            } else {
              _handledTapInButton(context: context);
            }
          },
        )
      ],
    );
  }

  _handledTapInButton({
    required BuildContext context,
  }) {
    showAlert(
      body: BodyAlert(
        alertModel: alertModel ??
            AlertModel(
              title: Container(),
              description: Container(),
            ),
        handledOpenImagePicker:(bool isCamera)=> _handledOpenImagePicker(isCamera, context),
      ),
      context: context,
      alertModel: alertModel ??
          AlertModel(
            title: Container(),
            description: Container(),
          ),
    );
  }

  _handledOpenImagePicker(bool isCamera, context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image;
    if (isCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      Navigator.pop(context);
      callBackPath(image.path);
    }
  }
}
