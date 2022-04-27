import 'package:flutter/material.dart';
import 'package:flutterlab_image_picker/organisms/frame_image.dart';
import 'package:flutterlab_image_picker/tokens/generate_provider_image.dart';

class SquareFrame extends StatelessWidget {
  final double size;
  final Color color;
  final String image;
  final ImageProviderFrame imageProvider;

  const SquareFrame({
    Key? key,
    required this.size,
    required this.color,
    required this.image,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _generateFrameImageByTyProvider();
  }

  _generateFrameImageByTyProvider() {
    switch (imageProvider) {
      case ImageProviderFrame.file:
        return _generateSimpleProvider();
      case ImageProviderFrame.assets:
        return _generateSimpleProvider();
      case ImageProviderFrame.network:
        return _generateSimpleProvider();
    }
  }

  Widget _generateSimpleProvider() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        image: generateProviderImage(
          image: image,
          imageProvider: imageProvider,
        ),
      ),
    );
  }

  Widget _generateCacheProvider() {
    return Container(
      height: 100,
      width: 100,
    )/*Shimmer.fromColors(
      baseColor: AppColor.gray,
      highlightColor: AppColor.white,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          image: generateProviderImage(
            image: image,
            imageProvider: imageProvider,
          ),
        ),
      ),
    )*/;/*CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, cacheImageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          image: generateProviderImage(
            image: image,
            imageProvider: imageProvider,
          ),
        ),
      ),
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColor.gray,
          highlightColor: AppColor.white,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
              image: generateProviderImage(
                image: image,
                imageProvider: imageProvider,
              ),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: AppColor.orange,
      ),
    )*/
  }
}
