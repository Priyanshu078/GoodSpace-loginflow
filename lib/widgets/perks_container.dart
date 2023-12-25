import 'package:flutter/widgets.dart';
import 'package:goodspacelogin/widgets/mytext.dart';

class PerksContainer extends StatelessWidget {
  const PerksContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.backgroundColor,
      required this.borderColor,
      required this.image,
      required this.text,
      required this.textColor});
  final double height;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final String image;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(3)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(
            width: width * 0.03,
          ),
          MyText(
            text: text,
            fontSize: 11,
            color: textColor,
            fontWeight: FontWeight.w400,
          )
        ],
      )),
    );
  }
}
