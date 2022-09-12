import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';


class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.title, required this.onTap, required this.enabled, this.child, this.color}) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          child: Center(
            child: child ?? Text(title,style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: onSurfaceTextColor
              ),),
          ),
          ),
        ),
    );
  }
}
