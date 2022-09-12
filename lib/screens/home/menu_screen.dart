import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';


class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  final _myZoomDrawerController = Get.find<MyZoomDrawerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      height: double.infinity,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: linearGradient(context)
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: (){
                _myZoomDrawerController.toggleDrawer();
              },
              child: const Icon(
                Icons.arrow_back_ios
              ),
            ),
          ),
          GetBuilder<MyZoomDrawerController>(
            builder: (_) => Column(
                children: [
                  _myZoomDrawerController.user != null ? Text(
                    _myZoomDrawerController.user!.displayName??"",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: onSurfaceTextColor
                    ),
                  ):const SizedBox(),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DrawerButton(
                          label: "Website",
                          icon: Icons.web,
                          onTap: (){
                            _myZoomDrawerController.webSite();
                          }
                      ),
                      DrawerButton(
                          label: "Facebook",
                          icon: Icons.facebook,
                          onTap: (){
                            _myZoomDrawerController.facebook();
                          }
                      ),
                      DrawerButton(
                          label: "Email",
                          icon: Icons.email,
                          onTap: (){
                            _myZoomDrawerController.email();
                          }
                      ),
                      DrawerButton(
                          label: "Logout",
                          icon: Icons.logout,
                          onTap: (){
                            _myZoomDrawerController.signOut();
                          }
                      )
                    ],
                  )
                ],
              ),
            ),
          
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key, required this.label, required this.icon, required this.onTap}) : super(key: key);

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 15, color: onSurfaceTextColor,),
      label: Text(label,style: const TextStyle(
        color: onSurfaceTextColor,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}

