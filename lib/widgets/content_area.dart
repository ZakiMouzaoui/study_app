import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';


class ContentArea extends StatelessWidget {
  const ContentArea({Key? key, this.addPadding=true, required this.child}) : super(key: key);
  final bool addPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top:Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: customScaffoldColor(context),
        ),
        padding: addPadding ? const EdgeInsets.only(
            top: 25,
            left: 25,
            right: 25,
            bottom: 25
          ) : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
