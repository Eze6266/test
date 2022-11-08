import 'dart:ui';

import 'package:brillo/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import 'colors.dart';

class ProceedButtonWidget extends StatelessWidget {
  const ProceedButtonWidget({
    Key? key,
    required this.size,
    required this.text,
    required this.press,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.only(left: 37, right: 37),
        width: size.width,
        height: 54,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.buttonTextStyle.copyWith(color: kPrimaryWhite),
          ),
        ),
      ),
    );
  }
}
