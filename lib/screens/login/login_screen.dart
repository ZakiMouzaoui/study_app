import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/auth/auth_controller.dart';


class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
          gradient: linearGradient(context)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                "assets/images/app_splash_logo.png",
                width: 200,
                height: 200,
            ),
            const SizedBox(height: 60,),
            const Text(
                "These is a study app. You can use it as you want",
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold
                ),
            ),
            const SizedBox(height: 60,),
            InkWell(
              onTap: (){
                controller.signInWithGoogle();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset("assets/icons/google.svg"),
                      //SizedBox(width: 70,),
                      const Expanded(child: SizedBox()),
                      Text("Sign in with google",style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                      ),),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
