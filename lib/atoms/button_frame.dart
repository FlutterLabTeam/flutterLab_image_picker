import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonFrame extends StatelessWidget {
  final Icon? icon;
  final double size;
  final Color color;
  final Function() handledButton;

  const ButtonFrame({
    Key? key,
    this.icon,
    required this.size,
    required this.color,
    required this.handledButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handledButton(),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: icon ??
            Icon(
              Icons.camera,
              size: size,
            ),
      ),
    );
  }
}
