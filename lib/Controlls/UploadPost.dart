// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class UploadPost with ChangeNotifier {
  selectPostImageType(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150.0),
                child: Divider(
                  thickness: 4.0,
                  color: Colors.white70,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                MaterialButton(
                  child: Text('Gallery'),
                  onPressed: null,
                ),
                MaterialButton(
                  child: Text('Camera'),
                  onPressed: null,
                )
              ]),
            ]),
          );
        });
  }
}
