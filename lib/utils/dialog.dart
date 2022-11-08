// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlurryDialog2 extends StatelessWidget {
  String title;
  String content;

  BlurryDialog2(this.title, this.content);
  TextStyle titleStyle = GoogleFonts.aBeeZee(
    textStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
  );
  TextStyle textStyle = GoogleFonts.aBeeZee(
    textStyle: TextStyle(color: Colors.black),
  );

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.cancel_outlined,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(width: 6),
              Text(
                title,
                style: titleStyle,
              ),
            ],
          ),
          content: Text(
            content,
            style: textStyle,
          ),
          actions: <Widget>[
            SizedBox(width: 10),
            Center(
              child: ElevatedButton(
                child: Text(
                  "A reset link has been sent to your mail",
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ));
  }
}
