import 'package:flutter/cupertino.dart';
import 'package:flutterlab_image_picker/atoms/circular_frame.dart';
import 'package:flutterlab_image_picker/atoms/square_frame.dart';
import 'package:flutterlab_image_picker/organisms/frame_image.dart';
import 'package:flutterlab_image_picker/tokens/app_color.dart';

class ContainerImageFrame extends StatelessWidget {
  final Color color;
  final double size;
  final String image;
  final Widget? body;
  final ImageProviderFrame imageProvider;
  final TypeFigureFrameImage typeFigureFrameImage;

  const ContainerImageFrame(
    this.image, {
    Key? key,
    this.body,
    this.size = 100,
    this.color = AppColor.orange,
    this.imageProvider = ImageProviderFrame.assets,
    this.typeFigureFrameImage = TypeFigureFrameImage.circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (typeFigureFrameImage) {
      case TypeFigureFrameImage.circle:
        return CircularFrame(
            size: size,
            color: color,
            image: image,
            imageProvider: imageProvider);
      case TypeFigureFrameImage.square:
        return SquareFrame(
          size: size,
          color: color,
          image: image,
          imageProvider: imageProvider,
        );
      case TypeFigureFrameImage.noneFigureFrame:
        return body ?? Container();
    }
  }
}
