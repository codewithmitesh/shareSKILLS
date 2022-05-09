// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:skillshare/Screens/post_screen.dart';

import '../Controlls/UploadPost.dart';

class FeedHelper with ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "shareSKILLS",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 68, 5, 73)),
          ),
          MaterialButton(
              child: Icon(Icons.camera_alt),
              // onPressed: null,
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: Provider.of<UploadPost>(context, listen: false)
                            .PostScreen(context),
                        type: PageTransitionType.bottomToTop));
              }
              // onPressed:
              //(){
              //
              //
              //
              //Provider.of<UploadPost>(context, listen: false)
              // .selectPostImageType(context),
              // }
              )
        ],
      ),
    );
  }

  notifyListeners();
}
