// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillshare/Controlls/control_utils.dart';

import 'auth.dart';

class FirebaseOperations with ChangeNotifier {
  late UploadTask imageUploadTask;

  Future uploadUserAvatar(BuildContext context) async {
    Reference imageReference = FirebaseStorage.instance.ref().child(
        'userProfileAvatar/${Provider.of<ControlUtils>(context, listen: false).getUserAvatar.path}/${TimeOfDay.now()}');
    imageUploadTask = imageReference.putFile(
        Provider.of<ControlUtils>(context, listen: false).getUserAvatar);
    await imageUploadTask.whenComplete(() {
      print("Image Uploaded!!");
    });
    // var userImageUrl = await (await imageUploadTask.onComplete().imageReference.);

    // var imageUrl = await imageReference.getDownloadURL().then((url) {
    //   Provider.of<ControlUtils>(context, listen: false).userAvatarUrl =
    //       url.toString();
    var imageUrl = await imageReference.getDownloadURL();

    print("Image Referenced URL => ${imageUrl}");
    Provider.of<ControlUtils>(context, listen: false).userAvatarUrl =
        imageUrl.toString();
    print(
        "Image URL to string stored in userAvatarUrl => ${Provider.of<ControlUtils>(context, listen: false).userAvatarUrl}");

    // imageReference.getDownloadURL().then((url) {
    //   Provider.of<ControlUtils>(context, listen: false).userAvatarUrl =
    //       url.toString();
    // print(
    //     "The USer Avatar Image url => ${Provider.of<ControlUtils>(context, listen: false).userAvatarUrl}");
    notifyListeners();
  }

  Future createUserCollections(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .set(data);
  }
}
