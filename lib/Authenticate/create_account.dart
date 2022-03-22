// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, implementation_imports, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/src/provider.dart';
import 'package:skillshare/Controlls/control_utils.dart';
import 'package:skillshare/Home/home.dart';
import '../Controlls/control_services.dart';
import '../Services/auth.dart';
import '../Services/firebase_operations.dart';
import '../Widgets/imagepicker.dart';

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

  var pickUserAV = new ControlUtils();

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
                    Container(
                      margin: EdgeInsets.only(top: 180, bottom: 0, left: 120),
                      child: GestureDetector(
                        onTap: () {
                          pickUserAV
                              .pickUserAvatar(context, ImageSource.gallery)
                              .whenComplete(() {
                            Navigator.pop(context);
                            Provider.of<ControlServices>(context, listen: false)
                                .showUserAvatar(context);
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: FileImage(
                              Provider.of<ControlUtils>(context, listen: false)
                                  .getUserAvatar),
                          radius: 60,
                        ),
                      ),

                      // Provider.of<ControlUtils>(context, listen: false)
                      //     .selectAvatarOptionSheet(context)
                      //     .whenComplete(() {
                      //   print("Uploaded Successfully");
                      // });

                      // child: CircleAvatar(
                      //   backgroundColor: Colors.purpleAccent[700],
                      //   radius: 60,
                      //   child: ElevatedButton(
                      //     child: Text("Add Image"),
                      //     onPressed: () {
                      //       Provider.of<ControlUtils>(context, listen: false)
                      //           .selectAvatarOptionSheet(context);

                      //     },
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
              SizedBox(
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
                        obscureText: true,
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
                                    print("Creating Collection"),
                                    Provider.of<FirebaseOperations>(context,
                                            listen: false)
                                        .createUserCollections(context, {
                                      'userId': Provider.of<Authentication>(
                                              context,
                                              listen: false)
                                          .getUserUid,
                                      'userEmail': emailController.text,
                                      'userImage': Provider.of<ControlUtils>(
                                              context,
                                              listen: false)
                                          .getUserAvatarUrl,
                                    })
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

  notifyListeners();
}
