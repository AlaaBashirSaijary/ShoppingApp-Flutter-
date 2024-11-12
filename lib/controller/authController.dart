import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newshop/consts/consts.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isloading = false.obs;

  Future<UserCredential?> loginMethod() async {
    UserCredential? userCredentail;
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Logın Error ',
        e.message ?? e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    return userCredentail;
  }

  Future<UserCredential?> SugnUpMethod({email, password}) async {
    UserCredential? userCredentail;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Logın Error ',
        e.message ?? e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    return userCredentail;
  }

  storeUserData({name, password, email}) async {
    DocumentReference store =
        await firestor.collection(usersCollection).doc(curentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': curentUser!.uid,
      'cart_count':"00",
      'wishList_count':"00",
      'order_count':"00",
    });
  }

  signoutMethod() async {
    try {
      await auth.signOut();
    } catch (e) {
      Get.snackbar(
        'Logın Error ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
