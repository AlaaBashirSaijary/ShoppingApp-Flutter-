import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newshop/consts/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var nameController = TextEditingController();
  var passController = TextEditingController();

  var profileImagePath = ''.obs;
  var profileImageLink = '';
  

  ChangeImage() async {
    try {
      final imge = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (imge == null) return;
      profileImagePath.value = imge.path;
    } on PlatformException catch (e) {
      Get.snackbar(
        'Error ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  uploadProileImage() async {
    var fileName = basename(profileImagePath.value);
    var destnation = 'images/${curentUser!.uid}/$fileName';
    Reference ref = FirebaseStorage.instance.ref().child(destnation);
    await ref.putFile(File(profileImagePath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  uploadProileFile({name,password,imgeUrl}) async {
    var store = firestor.collection(usersCollection).doc(curentUser!.uid);
    await store.set({
      'name':name,
      'password':password,
      'imgeUrl':imgeUrl
    },SetOptions(merge: true,));

  }
}
