import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodspacelogin/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpContainer extends StatelessWidget {
  const OtpContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.textEditingController,
      required this.color,
      required this.focusNode,
      required this.onChanged,
      required this.bordercolor});

  final double height;
  final double width;
  final TextEditingController textEditingController;
  final Color color;
  final FocusNode focusNode;
  final Function(String value) onChanged;
  final Color bordercolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 1, color: bordercolor),
          borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: width,
        child: TextField(
          focusNode: focusNode,
          onChanged: onChanged,
          cursorColor: themeColor,
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          controller: textEditingController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 20, top: 2),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
