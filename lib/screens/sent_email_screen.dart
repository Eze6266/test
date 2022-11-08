// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import 'home_screen.dart';
import 'signin_screen.dart';

class SentEmail extends StatefulWidget {
  const SentEmail({super.key});

  @override
  State<SentEmail> createState() => _SentEmailState();
}

class _SentEmailState extends State<SentEmail> {
  bool isEmailVerified = false;
  Timer? timer;
  bool canResendEmail = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  //   if (!isEmailVerified) {
  //     sendVerificationEmail();

  //     timer = Timer.periodic(Duration(seconds: 3), (timer) {
  //       checkEmailVerified();
  //     });
  //   }
  // }

  Future sendVerificationEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
    setState(() {
      canResendEmail = false;
    });
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      canResendEmail = true;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify Email',
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 250, 248, 248),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A verification email has been sent to your email',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  canResendEmail ? sendVerificationEmail() : null;
                },
                icon: Icon(Icons.email),
                label: Text(
                  'Resend Email',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: Center(
                  child: Text(
                    'Back to Login',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
