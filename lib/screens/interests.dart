// ignore_for_file: prefer_const_constructors

import 'package:brillo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../utils/button_widget.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class HobbiesScreen extends StatefulWidget {
  var username;
  var phone;

  HobbiesScreen({Key? key, this.phone, this.username}) : super(key: key);

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  List<String> hobbyList = [
    'Football',
    'Sky Diving',
    'Netflix',
    'Golf',
    'Syncronized Swimming',
    'Fishing',
    'Mountain climbing',
    'Hiking',
    'Painting',
    'Reading',
    'Archery',
    'Anime',
    'Bowling',
    'Fist Fighting',
    'Hiking'
  ];
  List<String>? selectedHobby = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 20.0,
          onPressed: (() {
            //  Navigator.pop(context);
          }),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(right: 37, left: 37),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hobbies",
                      style: Styles.headLineStyle2,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                        'Select your hobbies here. This will help us find some one with thesame interests as you.',
                        style: TextStyle(
                          color: Styles.grayColor,
                          fontSize: 14.0,
                        )),
                    SizedBox(height: 20),
                    Wrap(
                      children: hobbyList.map(
                        (hobby) {
                          bool isSelected = false;
                          if (selectedHobby!.contains(hobby)) {
                            isSelected = true;
                          }
                          return GestureDetector(
                            onTap: () {
                              if (!selectedHobby!.contains(hobby)) {
                                if (selectedHobby!.length < 5) {
                                  selectedHobby!.add(hobby);
                                  setState(() {});
                                  print(selectedHobby);
                                }
                              } else {
                                selectedHobby!
                                    .removeWhere((element) => element == hobby);
                                setState(() {});
                                print(selectedHobby);
                              }
                            },
                            child: Container(
                              height: 36,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 8),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? kActiveColor
                                      : Color.fromRGBO(242, 242, 242, 1),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    hobby,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Color.fromRGBO(0, 0, 0, 0.7),
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: -0.17,
                                        fontWeight: FontWeight.w500,
                                      ),
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
                SizedBox(height: 30),
                ProceedButtonWidget(
                  size: size,
                  text: 'Proceed',
                  press: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: HomeScreen(
                          phone: widget.phone,
                          username: widget.username,
                          hobbies: selectedHobby,
                        ),
                        pageAnimationType: BottomToTopTransition()));
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
