import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/widgets/app_circle_button.dart';


class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          gradient: linearGradient(context)
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 56,
            ),
            const SizedBox(height: 30,),
            const Text(
              "These is a study app. You can use it as you want, if you understand"
                  " how these works, you would be able to scale it",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: onSurfaceTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30,),
            AppCircleButton(
              child: const Icon(
                  Icons.arrow_forward,
                  size: 35
              ),
              onTap: (){
                Get.toNamed("/home");
              }, width: 50,
            )
          ],
        )
      ),
    );
  }
}

