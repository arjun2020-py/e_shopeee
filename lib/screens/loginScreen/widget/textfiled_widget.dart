import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class TextfiledWidget extends StatelessWidget {
  TextfiledWidget({super.key, required this.txt, required this.icon,required this.controller});

  final String txt;
  final Widget icon;
  final TextEditingController controller;
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: icon,
          hintText: txt,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
