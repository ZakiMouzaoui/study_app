import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({Key? key, required this.icon, required this.text}) : super(key: key);

  final Icon icon;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 4,),
        text
      ],
    );
  }
}
