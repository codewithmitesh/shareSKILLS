// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, implementation_imports, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/src/provider.dart';
import 'package:skillshare/Home/home.dart';
import '../Services/auth.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: lowercase_with_underscore
class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                // color: Colors.blue,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Images/SignUpImage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 58, bottom: 0, left: 30, right: 0),
                      child: Text(
                        "Create a free Account",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          color: Colors.purpleAccent[700],

                          // backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 359,
                width: 400,
                // color: Colors.blueGrey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Your Email ',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: passController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Your Password ',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text("Create Account"),
                      onPressed: () {
                        if (emailController.text.isNotEmpty) {
                          Provider.of<Authentication>(context, listen: false)
                              .createAccount(
                                  emailController.text, passController.text)
                              .whenComplete(() => {
                                    print(
                                        "Account Successfully created Please check in dataBase")
                                  });
                        } else {
                          print("Please Provide the proper email address !!!");
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
