import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class Dialogs{
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs(){
    return _singleton;
  }

  static Widget questionStartDialog({required Callback onTap}){
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Hi...",style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 25),
          ),
          Text("Please login before you start")
        ],
      ),
      actions: [
        TextButton(
            onPressed: onTap,
            child: const Text("Confirm")
        )
      ],
    );
  }
}