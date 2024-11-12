import 'package:newshop/consts/consts.dart';

class Firebaseservices {
  static getUser(uid) {
    return firestor.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
}
