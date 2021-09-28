import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';

class InputField extends StatelessWidget {
  final String hint;
  final int maxLines;
  const InputField({
    Key? key,
    required this.hint,
    required this.maxLines,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kNormalTextStyleWhite,
      autocorrect: true,
      cursorColor: kprimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: kNormalTextStyleGrey,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: const Color(0xff222222).withOpacity(.5),
      ),
    );
  }
}
