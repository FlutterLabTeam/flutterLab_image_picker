import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutterlab_image_picker/organisms/frame_image.dart';

DecorationImage generateProviderImage({
  required String image,
  ImageProvider? cacheImageProvider,
  required ImageProviderFrame imageProvider,
}) {
  switch (imageProvider) {
    case ImageProviderFrame.file:
      return DecorationImage(
        fit: BoxFit.fill,
        image: FileImage(
          File(image),
        ),
      );
    case ImageProviderFrame.assets:
      return DecorationImage(fit: BoxFit.fill, image: AssetImage(image));
    case ImageProviderFrame.network:
      return DecorationImage(fit: BoxFit.fill, image: cacheImageProvider??NetworkImage(image));
  }
}
