import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../controller/login_controller.dart';
import '../widget/text_widget.dart';
import '../widget/textfiled_widget.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff134462),
      body: Column(
        children: [
          Expanded(
            child: ClipPath(
              clipper: BottomClipper(),
              child: Container(
                height: 200,
                width: double.infinity,
                color: const Color(0xffff4181),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                          elevation: 0.1,
                          color: Colors.white.withOpacity(0.5),
                          child: const Icon(
                            Icons.shopping_bag,
                            size: 80,
                            color: Colors.black,
                          )),
                    ),
                    TextWidget(
                      txt: 'eShoppe',
                      txtSize: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                        txt: 'Modern E- Comm App',
                        color: Colors.white,
                        txtSize: 16),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TextfiledWidget(
                    controller: loginController.nameController,
                    txt: 'Email or Mobile',
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    )),
                TextfiledWidget(
                  controller: loginController.passwrodController,
                  txt: 'Passwrod',
                  icon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  height: 35,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        loginController.login(
                            loginController.nameController.text,
                            loginController.passwrodController.text);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Color(0xff134462)),
                      )),
                )
                
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 20)
      ..lineTo(size.width, size.height - 120)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(BottomClipper oldClipper) => false;
}
