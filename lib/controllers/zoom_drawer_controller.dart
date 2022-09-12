import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController{
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  User? user;

  @override
  void onReady() {
    user = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut(){
    Get.find<AuthController>().signOut();
  }

  void signIn(){

  }

  void webSite(){
    _launch(Uri.parse("https://www.google.com"));
  }

  void email(){
    final emailLaunchUri = Uri(
      scheme: "mailto",
      path: "zakimouzaoui123@gmail.com"
    );
    _launch(emailLaunchUri);
  }

  void facebook(){
    _launch(Uri.parse("https://www.facebook.com"));
  }

  Future<void> _launch(Uri uri) async{
    if(!await launchUrl(uri) ){
      throw 'could not launch $uri';
    }
  }
}
