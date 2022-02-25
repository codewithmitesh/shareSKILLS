// ignore_for_file: avoid_print

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillshare/Controlls/control_utils.dart';

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
    imageReference.getDownloadURL().then((url) {
      Provider.of<ControlUtils>(context, listen: false).userAvatarUrl =
          url.toString();
      print(
          "The USer Avatar Image url => ${Provider.of<ControlUtils>(context, listen: false).userAvatarUrl}");
      notifyListeners();
    });
  }
}
