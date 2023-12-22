import 'package:flutter/material.dart';
import 'package:goodspacelogin/constants/colors.dart';
import 'package:goodspacelogin/widgets/mytext.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.text,
  });

  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: themeColor,
          minimumSize: Size(width, height * 0.07)),
      onPressed: onPressed,
      child: MyText(
        text: text,
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
