// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, implementation_imports

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/src/provider.dart';
import 'package:skillshare/Home/home.dart';
import '../Services/auth.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: lowercase_with_underscore

//Login page Statefull Widget
class LoginPage extends StatefulWidget {
  LoginPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final Authentication _auth = new Authentication();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          controller: null,
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Login ID",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50, right: 50, top: 300),

                      height: 200,
                      // color: Colors.white,
                      child: Center(
                        child: ElevatedButton(
                          child: Text("Login with google"),
                          onPressed: () {
                            Provider.of<Authentication>(context, listen: false)
                                .signInWithGoogle()
                                .whenComplete(() {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: HomeProfile(),
                                      type: PageTransitionType.leftToRight));
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Images/Snowman.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(left: 5, top: 55),
                      child: TextField(
                        controller: emailController,
                        decoration:
                            InputDecoration(hintText: 'Enter Password ID'),
                      ),
                    ),
                    TextField(
                      controller: passController,
                      decoration: InputDecoration(hintText: 'Enter Email ID'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      child: Positioned(
                        // top: 100,
                        // left: 50,
                        child: ElevatedButton(
                          child: Text("Login Button"),
                          onPressed: () {
                            if (emailController.text.isNotEmpty) {
                              Provider.of<Authentication>(context,
                                      listen: false)
                                  .logIntoAccount(
                                      emailController.text, passController.text)
                                  .whenComplete(() => Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          child: HomeProfile(),
                                          type:
                                              PageTransitionType.leftToRight)));
                            } else {
                              // ignore: avoid_print
                              print('Please PRovide Proper Emails');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
