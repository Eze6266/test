// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brillo/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/signin_screen.dart';

class NavBarDrawer extends StatelessWidget {
  var username;
  var phone;
  var email;
  var hobbies;
  NavBarDrawer(
      {super.key, this.phone, this.username, this.email, this.hobbies});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('$username'),
            accountEmail: Text('$email'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/emmanuel.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              print('This is navbar');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(
                            username: username,
                            phone: phone,
                            hobbyList: hobbies,
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.golf_course),
            title: Text(
              'Buddies',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text(
              'Discover',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Setting & Privacy',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          ),
        ],
      ),
    );
  }
}
