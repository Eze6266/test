// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brillo/screens/interests.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class Profile extends StatefulWidget {
  var username;
  var phone;
  var hobbyList;

  Profile({super.key, this.phone, this.username, this.hobbyList});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/emmanuel.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  radius: 40,
                ),
                SizedBox(height: 20),
                Text(widget.username.toString()),
                SizedBox(height: 30),
                Text(widget.phone.toString()),
                SizedBox(height: 50),
                Wrap(
                  children: widget.hobbyList.map<Widget>(
                    (hobby) {
                      return Container(
                        height: 36,
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                          decoration: BoxDecoration(
                            color: kActiveColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              hobby,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
