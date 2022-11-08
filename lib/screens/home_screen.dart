// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../utils/navbar.dart';

class HomeScreen extends StatefulWidget {
  var username;
  var phone;
  var email;
  var hobbies;

  HomeScreen({super.key, this.phone, this.username, this.email, this.hobbies});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    print('This is home');
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 30),
      ),
      drawer: NavBarDrawer(
        phone: widget.phone,
        username: widget.username,
        email: widget.email,
        hobbies: widget.hobbies,
      ),
      backgroundColor: Color.fromARGB(255, 241, 238, 238),
      body: Center(),
    );
  }
}
