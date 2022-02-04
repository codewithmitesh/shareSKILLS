// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:skillshare/Authenticate/login_page.dart';
import 'package:skillshare/Services/auth.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Column(
        children: [
          Text(
            "Hello",
            style: TextStyle(fontSize: 100, fontFamily: 'Popins'),
          ),
          ElevatedButton(
            child: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Provider.of<Authentication>(context, listen: false)
                  .signOutWithGoogle()
                  .whenComplete(
                () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: LoginPage(context),
                          type: PageTransitionType.leftToRight));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
