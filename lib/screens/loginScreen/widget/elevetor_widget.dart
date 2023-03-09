import 'package:flutter/material.dart';

class ElevetorWidget extends StatelessWidget {
  ElevetorWidget({super.key, required this.tex, required this.onpress});
  final String tex;
  final Function() onpress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 40,
      child: ElevatedButton(
        onPressed: onpress,
        child: Text(
          tex,
          style: const TextStyle(color: Color(0xff134462)),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
