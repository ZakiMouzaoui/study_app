import 'package:flutter/material.dart';



class AppCircleButton extends StatelessWidget {
  const AppCircleButton({Key? key, required this.child, this.color, required this.width, required this.onTap}) : super(key: key);

  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        shape: const CircleBorder(),
        child: child,
        color: color,
        type: MaterialType.transparency,
        ),
    );
  }
}
