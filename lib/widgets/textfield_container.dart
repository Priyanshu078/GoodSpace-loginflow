import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodspacelogin/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldContainer extends StatelessWidget {
  const TextfieldContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.borderColor,
      required this.dividerColor,
      required this.textEditingController,
      required this.textColor});

  final double height;
  final double width;
  final Color borderColor;
  final Color dividerColor;
  final TextEditingController textEditingController;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.07,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: textFieldBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              // color: state is WrongNumberState ? wrongNumberColor : borderColor,
              color: borderColor,
              width: 1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/flag.png"),
          SizedBox(
            width: width * 0.03,
          ),
          VerticalDivider(
            width: 1,
            // color: state is WrongNumberState ? wrongNumberColor : borderColor,
            color: dividerColor,
          ),
          SizedBox(
            width: width * 0.03,
          ),
          Expanded(
              child: TextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            keyboardType: TextInputType.number,
            controller: textEditingController,
            style: GoogleFonts.poppins(
                fontSize: 16,
                // color: state is WrongNumberState
                //     ? wrongNumberColor
                //     : Colors.black,
                color: textColor,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 12),
                hintText: "Please enter mobile no.",
                hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: secondaryOnbardingColor),
                border: InputBorder.none),
          ))
        ],
      ),
    );
  }
}
